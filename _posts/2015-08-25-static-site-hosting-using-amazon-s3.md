---
id: 68
title: Static site hosting using Amazon S3
date: 2015-08-25T07:00:48+00:00
author: adam.bourg@gmail.com
layout: post
guid: http://www.adambourg.com/?p=68
permalink: /2015/08/25/static-site-hosting-using-amazon-s3/
snap_isAutoPosted:
  - "1"
snap_MYURL:
  - ""
snapEdIT:
  - "1"
snapLI:
  - 's:537:"a:1:{i:0;a:13:{s:4:"doLI";s:1:"1";s:8:"postType";s:1:"A";s:10:"SNAPformat";s:41:"New post has been published on %SITENAME%";s:11:"SNAPformatT";s:18:"New Post - %TITLE%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:11:"isPrePosted";s:1:"1";s:8:"isPosted";s:1:"1";s:4:"pgID";s:19:"6041843941291077632";s:7:"postURL";s:124:"https://www.linkedin.com/updates?discuss=&amp;scope=24020705&amp;stype=M&amp;topic=6041843941291077632&amp;type=U&amp;a=yHLa";s:5:"pDate";s:19:"2015-08-25 07:30:47";}}";'
image: /wp-content/uploads/2015/08/16002229606_5a0da8d9eb_o-512x510.jpg
categories:
  - aws
tags:
  - amazon
  - devops
  - was
---
My wife and I sell gluten free cookies at local coffee-shops and farmers markets. We love this business, it&#8217;s a lot of fun and time to spend together. We recently needed a website as we&#8217;re starting to approach local grocery stores and they need to read about our product.<!--more-->

Hosting can be expensive and a pain in the butt. The last thing I wanted was to have a system where I had to worry about backups or up time. If it weren&#8217;t for the friendly UI of WordPress, this site would be on there too. S3 is highly available and you only pay for the bandwidth used. The most I&#8217;ve ever paid in a month is about $10.00.

We use it for static website hosting. Our template was made by some team in India (<a href="http://www.chewyandgooeycookies.com" target="_blank">www.chewyandgooeycookies.com</a>) and we bought it through ThemeForest. We just chucked in our content, threw it up on S3 and we&#8217;re done.

**Here&#8217;s how you create a static site on S3: **

1. Sign up for an AWS account: <a href="http://www.Amazon.com/aws/" target="_blank">www.Amazon.com/aws/</a>

2. Once in the console, go to &#8220;S3&#8221;, then click the big blue button that says &#8220;Create Bucket&#8221;. Name this: www.yourdomain.com. Save this.

3. Then click &#8220;Create Bucket&#8221; again, name this: yourdomain.com. Save it.

4. Once you&#8217;ve got the buckets created, right click on the www bucket, go to properties and click on &#8220;Static Site Hosting&#8221;, set this to be the &#8220;Enable Website Hosting&#8221; property. Specific the index document (typically index.html). Then save.

[<img class="alignnone size-medium wp-image-72" src="http://www.adambourg.com/wp-content/uploads/2015/08/Screen-Shot-2015-08-10-at-12.25.58-AM-300x191.png" alt="AWS www" width="300" height="191" srcset="http://www.adambourg.com/wp-content/uploads/2015/08/Screen-Shot-2015-08-10-at-12.25.58-AM-300x191.png 300w, http://www.adambourg.com/wp-content/uploads/2015/08/Screen-Shot-2015-08-10-at-12.25.58-AM-1024x652.png 1024w, http://www.adambourg.com/wp-content/uploads/2015/08/Screen-Shot-2015-08-10-at-12.25.58-AM.png 1394w" sizes="(max-width: 300px) 100vw, 300px" />](http://www.adambourg.com/wp-content/uploads/2015/08/Screen-Shot-2015-08-10-at-12.25.58-AM.png)

5. Once you&#8217;ve done that go to the non www bucket, go to properties and then &#8220;Static Site Hosting&#8221;. Select the redirect all option, and point it to www.yourdomain.com. Then save.

[<img class="alignnone size-medium wp-image-71" src="http://www.adambourg.com/wp-content/uploads/2015/08/Screen-Shot-2015-08-10-at-12.25.36-AM-300x191.png" alt="AWS pointer to WWW" width="300" height="191" srcset="http://www.adambourg.com/wp-content/uploads/2015/08/Screen-Shot-2015-08-10-at-12.25.36-AM-300x191.png 300w, http://www.adambourg.com/wp-content/uploads/2015/08/Screen-Shot-2015-08-10-at-12.25.36-AM-1024x652.png 1024w, http://www.adambourg.com/wp-content/uploads/2015/08/Screen-Shot-2015-08-10-at-12.25.36-AM.png 1394w" sizes="(max-width: 300px) 100vw, 300px" />](http://www.adambourg.com/wp-content/uploads/2015/08/Screen-Shot-2015-08-10-at-12.25.36-AM.png)

&nbsp;

6. Go into the www bucket, select all items, right click and select &#8220;Make Public&#8221;. Agree to the warning and click save. This allows the visitors of your site to see your content.

This gives you a working website, what do you do when you need that www.yourdomain.com to work? There&#8217;s an extra couple of steps there. Basically you create a Route 53 domain configuration through the AWS console and setup the DNS to point to the S3 bucket. Then you configure on the domain name side of things to point to the Amazon DNS servers. More information about this can be found by reading Amazon&#8217;s documentation on using <a href="http://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html" target="_blank">custom domain names.</a>

_Photo provided by <a href="https://www.flickr.com/photos/filterforge/" target="_blank">Filter Forge</a> over at <a href="https://www.flickr.com/photos/filterforge/16002229606/in/photolist-qo4Bms-aviUzK-cVG4SE-8ufLRY-6ELvxb-BNAet-5keFrC-8ucG7i-8ucFTB-8ufLWh-8ufBQo-8ucxR6-8ufCMu-8ucxs8-4ymRh2-8ufBUE-e1DCLH-3KgUhV-dRKKyd-bPpS7F-7twkw-bu5xdr-ushYkr-2agawb-7GF9mX-u4QgRK-ehd1oM-2agayj-ic97pb-6FmKWp-ic8PYp-6wCBw5-mdjqg-4nTgvd-4nTguh-jRXfQs-4vTsV3-4KikR-6k425V-818o8-pxtzp-diyNjf-5AJmNP-5hsWGK-5azeMq-7Jw94t-7EaGzZ-6HAzD1-3zSR5j-8ucyct" target="_blank">Flickr</a> under the creative commons license. _

<div data-animation="no-animation" data-icons-animation="no-animation" data-overlay="" data-change-size="" data-button-size="1" style="font-size:1em;display:none;" class="supsystic-social-sharing supsystic-social-sharing-package-flat supsystic-social-sharing-content supsystic-social-sharing-content-align-center">
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter mail" target="_blank" title="Mail" href="#" data-nid="16" data-pid="1" data-post-id="68" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-paper-plane"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter facebook" target="_blank" title="Facebook" href="http://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.adambourg.com%2F2015%2F08%2F25%2Fstatic-site-hosting-using-amazon-s3%2F" data-nid="1" data-pid="1" data-post-id="68" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-facebook"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter twitter" target="_blank" title="Twitter" href="https://twitter.com/share?url=http%3A%2F%2Fwww.adambourg.com%2F2015%2F08%2F25%2Fstatic-site-hosting-using-amazon-s3%2F&text=Static+site+hosting+using+Amazon+S3" data-nid="2" data-pid="1" data-post-id="68" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-twitter"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter linkedin" target="_blank" title="Linkedin" href="https://www.linkedin.com/shareArticle?mini=true&title=Static+site+hosting+using+Amazon+S3&url=http%3A%2F%2Fwww.adambourg.com%2F2015%2F08%2F25%2Fstatic-site-hosting-using-amazon-s3%2F" data-nid="13" data-pid="1" data-post-id="68" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-linkedin"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter reddit" target="_blank" title="Reddit" href="http://reddit.com/submit?url=http%3A%2F%2Fwww.adambourg.com%2F2015%2F08%2F25%2Fstatic-site-hosting-using-amazon-s3%2F&title=Static+site+hosting+using+Amazon+S3" data-nid="6" data-pid="1" data-post-id="68" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-reddit"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
</div>