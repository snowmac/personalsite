---
id: 138
title: Automated E2E testing using protractor
date: 2015-09-15T06:00:20+00:00
author: adam.bourg@gmail.com
layout: post
guid: http://www.adambourg.com/?p=138
permalink: /2015/09/15/automated-e2e-testing-using-protractor/
snap_MYURL:
  - ""
snapEdIT:
  - "1"
snap_isAutoPosted:
  - "1"
snapLI:
  - 's:537:"a:1:{i:0;a:13:{s:4:"doLI";s:1:"1";s:8:"postType";s:1:"A";s:10:"SNAPformat";s:41:"New post has been published on %SITENAME%";s:11:"SNAPformatT";s:18:"New Post - %TITLE%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:11:"isPrePosted";s:1:"1";s:8:"isPosted";s:1:"1";s:4:"pgID";s:19:"6049440470348677120";s:7:"postURL";s:124:"https://www.linkedin.com/updates?discuss=&amp;scope=24020705&amp;stype=M&amp;topic=6049440470348677120&amp;type=U&amp;a=gSuB";s:5:"pDate";s:19:"2015-09-15 06:36:41";}}";'
image: /wp-content/uploads/2015/10/5176421765_1d6a1b4aaf_o-825x510.jpg
categories:
  - javascript
tags:
  - automated
  - e2e tests
  - javascript
  - tdd
  - unit tests
---
At UHG we use Protractor to test our Backbone app for automated E2E dev only regression tests. We do this as apart of an automated CI process to ensure every branch we ingrate doesn&#8217;t break existing functionaility. Today, I&#8217;m going to walk you through our setup and how you can use Protractor (an Angular tool) to test your non-Angular app. <!--more-->

**Get the test runner**

I like running protractor by the CLI as much as the next guy, but you&#8217;ll want to get the grunt task runner first. This is available at: <a href="https://github.com/teerapap/grunt-protractor-runner" target="_blank">https://github.com/teerapap/grunt-protractor-runner</a>

Add the following to your grunt tasks file:

> webdriver: {
  
> command: &#8216;./node_modules/webdriver-manager/bin/webdriver-manager start&#8217;
  
> }

This will allow you to now run the protractor instance by:

  1. grunt webdriver // starts the selnium interface
  2. grunt test // runs the tests

**Configure your instance**

To our tasks file we add the following options for protractor:

> protractor: {
  
> options: {
  
> configFile: &#8216;./config/test/protractor-config.js&#8217;, // Default config file
  
> keepAlive: false, // If false, the grunt process stops when the test fails.
  
> args: {}
  
> },
  
> runner: {}
  
> }

Within the config file we provide a few common global helper methods. Within the config, we supply it a few options.

First, we tell it where the selenium sever is running:

> seleniumAddress: &#8216;http://127.0.0.1:4444/wd/hub&#8217;,

This is the default address location for the default instance.

Next we tell it what testing framework we want to use. Jasmine is default but we have all of our other tests written in Mocha. Mocha bundled with Chai with a <a href="https://github.com/domenic/chai-as-promised/" target="_blank">Chai As Promised plugin</a> helps us do Async tests.

> framework: &#8216;mocha&#8217;,
> 
> mochaOpts: {
  
> timeout: 10000
  
> },

Then we have the following onPrepare function that loads a config file and a reusable functions file into the protractor global scope

> onPrepare: function() {
  
> &#8216;use strict&#8217;;
> 
> // Merge in default config options for the global scope
  
> _.extend(global, globalConfig);
> 
> // Merge the object containing all our reusable stuff into the global scope
  
> _.extend(global, reusableFunctions);
  
> }

Having things in the global scope that protractor uses; allows us to provide some easy to use default functions that make our testing efforts much easier.

A couple helpers we&#8217;ve written are:

  1. Checking for the presence of an element:
  
    > isPresent: function(element){
  
    > return browser.isElementPresent(element);
  
    > },

  2. We abstract the browser sleep function
  
    > // Allows us to pause to allow the browser to render stuff to the ui browserSleep: function(callback,time){
  
    > var sleepTime = time ? time : 1000;
  
    > if(callback){ return browser.sleep(sleepTime).then(callback()); }
  
    > },

  3. Inject javascript helper:
  
    > runScript: function(script){ return browser.executeScript(script); },

  4. Inject sinon:
  
    > injectSinon: function(){ browser.executeScript(&#8220;server = sinon.fakeServer.create();&#8221;); },

  5. Lastly we need to force the browser to not wait for Angular since this isn&#8217;t an Angular app:
  
    > disableAngularWait: function(){ browser.ignoreSynchronization = true; },
    
    ## An example spec

<a href="http://www.adambourg.com/wp-content/uploads/2015/10/Screen-Shot-2015-09-09-at-9.09.44-AM.png" target="_blank"><img class="alignnone size-medium wp-image-143" src="http://www.adambourg.com/wp-content/uploads/2015/10/Screen-Shot-2015-09-09-at-9.09.44-AM-300x223.png" alt="Screen Shot 2015-09-09 at 9.09.44 AM" width="300" height="223" srcset="http://www.adambourg.com/wp-content/uploads/2015/10/Screen-Shot-2015-09-09-at-9.09.44-AM-300x223.png 300w, http://www.adambourg.com/wp-content/uploads/2015/10/Screen-Shot-2015-09-09-at-9.09.44-AM-1024x761.png 1024w" sizes="(max-width: 300px) 100vw, 300px" /></a>

In the image above we use the standard describe / it syntax. We use a before to load the page, setup generic elements and then we fire &#8220;done():&#8221; which allows us to tell Mocha that the tests are finished.

A line like the one below allows us to check for an element to eventually be present, once the page is done loading, then notify done.

> expect(emailElement.isPresent()).to.eventually.be.true.notify(done);

We can take an element then send it new values, such as an email address field, we provide it an email address to test with:

> emailElement.sendKeys(email)

## Running the code

To run the code we trigger the grunt web driver runner:

> grunt webdriver;

To run the tests:

> grunt test;

Hopefully now you have a better understanding on how to use protractor to do automated UI testing.

_<a href="https://www.flickr.com/photos/ideonexus/5176421765/in/photolist-8TqvR8-8ToyJb-8Tkr7k-8Tkqpt-8TkpBi-8Tko9Z-8TotUy-cfJRV7-7Rcaka-bZQ8xj-bZQ8pd-bZQ8hy-bZQ86y-bZQ7Tm-bZQ7J5-bZQ7z5-bZQ7su-bZQ7j9-bZQ6wj-5QdEfU-78xKWy-71M5wp-8VjNVq-sRqrHZ-sRqojp-st2gZc-sKtHyH-6Mn46u-rNteyY-b5MJJ-6DgaQK-4okyxS-4okyuf-e4zqvC-q67bMf-sKhfNw-st1ZDX-sKhcpN-sKu1d8-rNEXtg-sKtEZe-sKtLik-rNEMNp-sKuhe6-ssTGpj-rNEAdR-sRd6nj-68JsRb-oYpzqR-jdWajT" target="_blank">Photo by Ryan Somma. </a>_

<div data-animation="no-animation" data-icons-animation="no-animation" data-overlay="" data-change-size="" data-button-size="1" style="font-size:1em;display:none;" class="supsystic-social-sharing supsystic-social-sharing-package-flat supsystic-social-sharing-content supsystic-social-sharing-content-align-center">
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter mail" target="_blank" title="Mail" href="#" data-nid="16" data-pid="1" data-post-id="138" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-paper-plane"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter facebook" target="_blank" title="Facebook" href="http://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.adambourg.com%2F2015%2F09%2F15%2Fautomated-e2e-testing-using-protractor%2F" data-nid="1" data-pid="1" data-post-id="138" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-facebook"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter twitter" target="_blank" title="Twitter" href="https://twitter.com/share?url=http%3A%2F%2Fwww.adambourg.com%2F2015%2F09%2F15%2Fautomated-e2e-testing-using-protractor%2F&text=Automated+E2E+testing+using+protractor" data-nid="2" data-pid="1" data-post-id="138" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-twitter"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter linkedin" target="_blank" title="Linkedin" href="https://www.linkedin.com/shareArticle?mini=true&title=Automated+E2E+testing+using+protractor&url=http%3A%2F%2Fwww.adambourg.com%2F2015%2F09%2F15%2Fautomated-e2e-testing-using-protractor%2F" data-nid="13" data-pid="1" data-post-id="138" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-linkedin"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter reddit" target="_blank" title="Reddit" href="http://reddit.com/submit?url=http%3A%2F%2Fwww.adambourg.com%2F2015%2F09%2F15%2Fautomated-e2e-testing-using-protractor%2F&title=Automated+E2E+testing+using+protractor" data-nid="6" data-pid="1" data-post-id="138" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-reddit"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
</div>