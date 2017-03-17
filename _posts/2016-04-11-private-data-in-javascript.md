---
id: 300
title: Private Data in Javascript
date: 2016-04-11T15:57:38+00:00
author: adam.bourg@gmail.com
layout: post
guid: http://www.adambourg.com/?p=300
permalink: /2016/04/11/private-data-in-javascript/
snap_isAutoPosted:
  - "1"
snap_MYURL:
  - ""
snapEdIT:
  - "1"
snapFB:
  - 's:298:"a:1:{i:0;a:10:{s:4:"doFB";s:1:"1";s:8:"postType";s:1:"A";s:10:"AttachPost";s:1:"2";s:10:"SNAPformat";s:51:"New post (%TITLE%) has been published on %SITENAME%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:2:"do";s:1:"1";s:11:"isPrePosted";s:1:"1";}}";'
snapLI:
  - 's:308:"a:1:{i:0;a:10:{s:4:"doLI";s:1:"1";s:8:"postType";s:1:"A";s:10:"SNAPformat";s:41:"New post has been published on %SITENAME%";s:12:"liMsgFormatT";s:18:"New Post - %TITLE%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:2:"do";s:1:"1";s:11:"isPrePosted";s:1:"1";}}";'
image: /wp-content/uploads/2016/04/6323055584_09be3377de_b-825x510.jpg
categories:
  - deeper look
  - javascript
---
One of the things that I feel is really missing from the JavaScript programming language is the option of private data and private behavior (methods) to an object. I never could get data that an outside caller couldn&#8217;t see. That is until I discovered the JavaScript closure.

A closure is typically a function. You can control scope, by returning an object containing data and public instances. What does one look like?

> (function(){
> 
> })();

On line 1, we declare an anonymous function and on line 3, we end it and then immediately invoke it. We don&#8217;t return any data, we return undefined by default. What&#8217;s interesting is that you can pass arguments so that the variables that you use within the scope are local:

> (function($,_){
> 
> })($, _);

As you can see we&#8217;re now passing in a jQuery block and an underscore block, no longer do they have to be globals.

To expose data you can return specific data or an object:

> (function($,_){
  
> var myPrivateData = &#8220;randomSocialSecurityNumber&#8221;;
> 
> return {
  
> time: Date.now(),
  
> socialSecurityNumber: myPrivateData
  
> }
  
> })($,_);

Here&#8217;s a full example with public and private data:

> var App = window.App; // get a global
  
> var id = submissionID;
> 
> var payRoll = (function($,_, App, id){
  
> var user = App.collection.model(id);
  
> var timeSheet = App.collection.timeSheets.model({userid: id});
> 
> var grossPay = (function(timesheet){
  
> return timesheet.rate * timesheet.hours;
  
> })(timeSheet);
> 
> var takeHomeRate = (function(user){
  
> return 1 &#8211; user.taxRate;
  
> })(user);
> 
> return {
  
> hourlyRate: timeSheet.rate,
  
> hoursWorked: timeSheet.hours,
  
> grossPay: grossPay,
  
> netPay: grossPay * takeHomeRate,
  
> id: user.id,
  
> firstName: user.firstName,
  
> lastName: user.lastName,
  
> };
> 
> })($, _, App, id);

So for our payroll object, if we wanted to access the takeHomeRate, we can&#8217;t because it&#8217;s completely private. We can&#8217;t say payRoll.takeHomeRate. But we can say payRoll.grossPay, because it is data we expose by returning it. If we don&#8217;t return it, won&#8217;t be public. Which means that now we can have an assortment of private attributes to an object that has no exposure, creating a contract by which you can modify the internal structure of JavaScript objects without changing the contract and breaking future users.

_<a href="https://www.flickr.com/photos/restricteddata/6323055584/" target="_blank">Photo</a> by <a href="https://www.flickr.com/photos/restricteddata/" target="_blank">RestrictedData</a> via <a href="https://www.flickr.com/" target="_blank">Flickr</a>_

<div data-animation="no-animation" data-icons-animation="no-animation" data-overlay="" data-change-size="" data-button-size="1" style="font-size:1em;display:none;" class="supsystic-social-sharing supsystic-social-sharing-package-flat supsystic-social-sharing-content supsystic-social-sharing-content-align-center">
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter mail" target="_blank" title="Mail" href="#" data-nid="16" data-pid="1" data-post-id="300" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-paper-plane"></i>
  
  <div class="counter-wrap standard">
    <span class="counter">1</span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter facebook" target="_blank" title="Facebook" href="http://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.adambourg.com%2F2016%2F04%2F11%2Fprivate-data-in-javascript%2F" data-nid="1" data-pid="1" data-post-id="300" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-facebook"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter twitter" target="_blank" title="Twitter" href="https://twitter.com/share?url=http%3A%2F%2Fwww.adambourg.com%2F2016%2F04%2F11%2Fprivate-data-in-javascript%2F&text=Private+Data+in+Javascript" data-nid="2" data-pid="1" data-post-id="300" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-twitter"></i>
  
  <div class="counter-wrap standard">
    <span class="counter">2</span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter linkedin" target="_blank" title="Linkedin" href="https://www.linkedin.com/shareArticle?mini=true&title=Private+Data+in+Javascript&url=http%3A%2F%2Fwww.adambourg.com%2F2016%2F04%2F11%2Fprivate-data-in-javascript%2F" data-nid="13" data-pid="1" data-post-id="300" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-linkedin"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter reddit" target="_blank" title="Reddit" href="http://reddit.com/submit?url=http%3A%2F%2Fwww.adambourg.com%2F2016%2F04%2F11%2Fprivate-data-in-javascript%2F&title=Private+Data+in+Javascript" data-nid="6" data-pid="1" data-post-id="300" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-reddit"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
</div>