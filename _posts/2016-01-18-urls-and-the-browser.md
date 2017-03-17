---
id: 227
title: URLs and the browser
date: 2016-01-18T07:30:10+00:00
author: adam.bourg@gmail.com
layout: post
guid: http://www.adambourg.com/?p=227
permalink: /2016/01/18/urls-and-the-browser/
snap_MYURL:
  - ""
snapEdIT:
  - "1"
snapFB:
  - 's:280:"a:1:{i:0;a:9:{s:4:"doFB";s:1:"1";s:8:"postType";s:1:"A";s:10:"AttachPost";s:1:"2";s:10:"SNAPformat";s:51:"New post (%TITLE%) has been published on %SITENAME%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:11:"isPrePosted";s:1:"1";}}";'
snap_isAutoPosted:
  - "1"
snapLI:
  - 's:289:"a:1:{i:0;a:9:{s:4:"doLI";s:1:"1";s:8:"postType";s:1:"A";s:10:"SNAPformat";s:41:"New post has been published on %SITENAME%";s:11:"SNAPformatT";s:18:"New Post - %TITLE%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:11:"isPrePosted";s:1:"1";}}";'
image: /wp-content/uploads/2016/01/89905761_8e367bfe14_b-825x510.jpg
categories:
  - deeper look
tags:
  - advanced
  - deeper look
  - uri
  - url
---
I love working with the web, there is so much to know and learn about web development. Have you ever thought about the URL? I recently learned quite a bit about the URL. The URL is composed primarily of a few things:

  1. The Scheme, which is followed by the &#8220;://&#8221;. This is typically http, https or ftp. Others such as file:// are also valid.
  2. You can also supply user name and password &#8220;user:password@&#8221;
  3. There is the host:port, which could be something like localhost:3000
  4. Then we have the path, such as /api/v1/news_feed
  5. Finally we have the query parameter, such as ?id=5&name=&#8221;adam&#8221;.
  6. The fragment identifier is the &#8220;#&#8221; in the URL. This is client side only and is not sent to the server. The fragment can be used for client routing or for client specific behavior or specifically to link to a certain location in a document.
  7. All of 1 &#8211; 5 are sent to the server. List item 6 is not sent to the server.

#6 is really interesting and new to me. I&#8217;ve never thought about a URL having two componets, client side and server side. It&#8217;s really cleaver and genius. What this raises is issues with a SPA framework however. The whole issue comes down to client vs server behavior, the &#8220;clean&#8221;, &#8220;marketing friendly&#8221; urls that don&#8217;t rely on the hash tag are always sent to the server. This is why you need mod-rewrite rules in apache. Everytime you navigate in a SPA, all of the url before the fragment identifier is sent to the server. The server has to ignore all the of these client specific urls. This adds a lot of complexitity and unneeded overhead in dealing with your SPA application. A better approach is for server invoked behavior, use the part of the URI before the fragement identifier, and for the client specific behavior, use the space after the fragment identifier.

**Resources:**

  * <a href="https://en.wikipedia.org/wiki/Uniform_Resource_Locator" target="_blank">URI</a> via Wikipedia
  * <a href="https://blog.httpwatch.com/2011/03/01/6-things-you-should-know-about-fragment-urls/" target="_blank">6 Things You Should Know About Fragment URLs </a>via HTTP watch
  * <a href="https://en.wikipedia.org/wiki/Fragment_identifier" target="_blank">Fragment identifier </a>via Wikipedia

_<a href="https://www.flickr.com/photos/sallypics/89905761/in/photolist-8WMRk-7dJcWU-b3ok66-b3qEP2-54NBZ8-q42yua-82s4Hh-vKMUx4-65ySbj-9YB5By-54NC4X-7gCiqb-m42FEf-qHL2yd-hqadgP-kgSEp7-6pieNf-o5hWLZ-kbKuTY-qyGjRX-fUEw2D-kDsGBZ-kHCUvz-jX5DiD-j48VsE-j8KGVP-jYZJqH-qZJt3G-hKiDAs-p6GdEP-gUnwvm-jjJHhQ-8vRicj-iWcvJm-ndfar3-pVsHhM-nsgAQf-gjc8tU-ecz2e-iQbCeH-jgFtAe-iArHBR-jpEe8S-pPL4mf-ine7zF-gQTfaQ-i1Qmpw-nCQ8Nm-hTiGjz-ijukes" target="_blank">Photo</a> by <a href="https://www.flickr.com/photos/sallypics/" target="_blank">~My aim is true~</a> via <a href="https://www.flickr.com" target="_blank">Flickr</a>_

<div data-animation="no-animation" data-icons-animation="no-animation" data-overlay="" data-change-size="" data-button-size="1" style="font-size:1em;display:none;" class="supsystic-social-sharing supsystic-social-sharing-package-flat supsystic-social-sharing-content supsystic-social-sharing-content-align-center">
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter mail" target="_blank" title="Mail" href="#" data-nid="16" data-pid="1" data-post-id="227" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-paper-plane"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter facebook" target="_blank" title="Facebook" href="http://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.adambourg.com%2F2016%2F01%2F18%2Furls-and-the-browser%2F" data-nid="1" data-pid="1" data-post-id="227" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-facebook"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter twitter" target="_blank" title="Twitter" href="https://twitter.com/share?url=http%3A%2F%2Fwww.adambourg.com%2F2016%2F01%2F18%2Furls-and-the-browser%2F&text=URLs+and+the+browser" data-nid="2" data-pid="1" data-post-id="227" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-twitter"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter linkedin" target="_blank" title="Linkedin" href="https://www.linkedin.com/shareArticle?mini=true&title=URLs+and+the+browser&url=http%3A%2F%2Fwww.adambourg.com%2F2016%2F01%2F18%2Furls-and-the-browser%2F" data-nid="13" data-pid="1" data-post-id="227" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-linkedin"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter reddit" target="_blank" title="Reddit" href="http://reddit.com/submit?url=http%3A%2F%2Fwww.adambourg.com%2F2016%2F01%2F18%2Furls-and-the-browser%2F&title=URLs+and+the+browser" data-nid="6" data-pid="1" data-post-id="227" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-reddit"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
</div>