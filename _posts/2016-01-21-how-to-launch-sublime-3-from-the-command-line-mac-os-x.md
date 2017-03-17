---
id: 217
title: How to launch Sublime 3 from the command line (Mac OS X)
date: 2016-01-21T07:00:40+00:00
author: adam.bourg@gmail.com
layout: post
guid: http://www.adambourg.com/?p=217
permalink: /2016/01/21/how-to-launch-sublime-3-from-the-command-line-mac-os-x/
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
image: /wp-content/uploads/2016/01/4340437358_fccf965923_b-825x510.jpg
categories:
  - productivity
  - thoughts
  - thursday
---
I&#8217;m an avid <a href="https://www.sublimetext.com/" target="_blank">Sublime</a> user. It&#8217;s the VIM of the 21st centry. I also constantly use the command line. The two can be one, even though Sublime is a GUI driven application and not a CLI application. One of the most helpful things when working with the command line and needing to open up an editor is to call Sublime from the command line followed by the file or folder name.

To do this, if you&#8217;re on a mac use the following link:

> ln -s &#8220;/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl&#8221; /usr/local/bin/subl

Then from the command line you can do the following to open something in Sublime.

> subl test.html

I tested this in Sublime 3 using both Bash and <a href="https://github.com/robbyrussell/oh-my-zsh" target="_blank">ZSH</a>.

_<a href="https://www.flickr.com/photos/msimdottv/4340437358/in/photolist-7BxSNS-pfEcLr-fKURhz-ed9XJo-2o3v-9W9kS8-e3R82c-3BNPpE-dU1Vpt-9W9kJR-avBg1U-prVdFK-wiSLKy-3GrodF-23fm5q-w2WKFq-fJBHDX-az117N-dR6oM8-fJBHAk-7XV88P-9igEdx-9nBdoX-8qEhqb-dU31yz-6mNHcj-fJBHw8-fJBHrK-fJUfa7-oyPW3d-fJUf5u-ojqrQk-8Qf8Jo-i7Csdx-ew9dzr-fMSa93-asX4ws-dxEKfn-89DcR4-gfojxQ-ac4Jyv-f1qhXs-8P2UKY-826xnX-ddj1kZ-ATyr2W-8nkv5W-7UEt3A-qHxWpb-BA6oGa" target="_blank">Photo</a> by <a href="https://www.flickr.com/photos/msimdottv/" target="_blank">Matthew Simantov</a> via <a href="https://www.flickr.com" target="_blank">Flickr</a>_

<div data-animation="no-animation" data-icons-animation="no-animation" data-overlay="" data-change-size="" data-button-size="1" style="font-size:1em;display:none;" class="supsystic-social-sharing supsystic-social-sharing-package-flat supsystic-social-sharing-content supsystic-social-sharing-content-align-center">
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter mail" target="_blank" title="Mail" href="#" data-nid="16" data-pid="1" data-post-id="217" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-paper-plane"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter facebook" target="_blank" title="Facebook" href="http://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.adambourg.com%2F2016%2F01%2F21%2Fhow-to-launch-sublime-3-from-the-command-line-mac-os-x%2F" data-nid="1" data-pid="1" data-post-id="217" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-facebook"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter twitter" target="_blank" title="Twitter" href="https://twitter.com/share?url=http%3A%2F%2Fwww.adambourg.com%2F2016%2F01%2F21%2Fhow-to-launch-sublime-3-from-the-command-line-mac-os-x%2F&text=How+to+launch+Sublime+3+from+the+command+line+%28Mac+OS+X%29" data-nid="2" data-pid="1" data-post-id="217" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-twitter"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter linkedin" target="_blank" title="Linkedin" href="https://www.linkedin.com/shareArticle?mini=true&title=How+to+launch+Sublime+3+from+the+command+line+%28Mac+OS+X%29&url=http%3A%2F%2Fwww.adambourg.com%2F2016%2F01%2F21%2Fhow-to-launch-sublime-3-from-the-command-line-mac-os-x%2F" data-nid="13" data-pid="1" data-post-id="217" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-linkedin"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter reddit" target="_blank" title="Reddit" href="http://reddit.com/submit?url=http%3A%2F%2Fwww.adambourg.com%2F2016%2F01%2F21%2Fhow-to-launch-sublime-3-from-the-command-line-mac-os-x%2F&title=How+to+launch+Sublime+3+from+the+command+line+%28Mac+OS+X%29" data-nid="6" data-pid="1" data-post-id="217" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-reddit"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
</div>