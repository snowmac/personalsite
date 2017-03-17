---
id: 169
title: 'Thoughts for Thursday: Lazy rebasing'
date: 2015-09-24T07:00:25+00:00
author: adam.bourg@gmail.com
layout: post
guid: http://www.adambourg.com/?p=169
permalink: /2015/09/24/thoughts-for-thursday-lazy-rebasing/
snap_MYURL:
  - ""
snapEdIT:
  - "1"
snap_isAutoPosted:
  - "1"
snapLI:
  - 's:537:"a:1:{i:0;a:13:{s:4:"doLI";s:1:"1";s:8:"postType";s:1:"A";s:10:"SNAPformat";s:41:"New post has been published on %SITENAME%";s:11:"SNAPformatT";s:18:"New Post - %TITLE%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:11:"isPrePosted";s:1:"1";s:8:"isPosted";s:1:"1";s:4:"pgID";s:19:"6052713829933080576";s:7:"postURL";s:124:"https://www.linkedin.com/updates?discuss=&amp;scope=24020705&amp;stype=M&amp;topic=6052713829933080576&amp;type=U&amp;a=mcdL";s:5:"pDate";s:19:"2015-09-24 07:23:51";}}";'
image: /wp-content/uploads/2015/09/3619118433_ef27acb1ee_o-825x510.jpg
categories:
  - git
  - thoughts
  - thursday
tags:
  - git
  - lifehacks
  - thought
  - thoughts for thursday
---
Rebasing is extremely useful, lets say you branched off of release 1.8.3 and need to fix a defect, but it wasn&#8217;t completed until 1.8.3 was already on production and 1.8.4 is the new hotness. git rebase release1.8.4 defectBranchName will take defectBranchName and reapply the commits over release1.8.4&#8217;s history instead of what it was originally based off of.

The problem is if there are conflicts and sometimes there can be conflicts at every commit. So if possible, what I do is:

> git checkout defectBranchName
  
> git log

At git log, count the number of commits you made on the branch, N = number of commits to go back

> git reset HEAD~N &#8211;soft
  
> git stash
  
> git rebase release1.8.4
  
> git stash apply

Now you fix the merge conflicts, and commit. The downside is you lose commit history and can create issues if you do this on something like master because you&#8217;ll be changing history. It&#8217;ll be especially big impact if you work on a team and do this on develop or master, but your little feature branch should be ok if no branched off it.

Now there you go, a handy little trick to quickly get synced up with history!

_Photo by <a href="https://www.flickr.com/photos/heipei/3619118433/in/photolist-6vNVPF-pLpyew-6eUHcZ-8FZoD6-8qdoUX-a6ZELY-a6ZEk7-qQMLHy-5DHUhY-9T47Fn-9uAQts-9uxPX8-66LqDr-a6WNZM-34Um2f-9uAQvd-9uAQrw-qqmbG-7F5esy-dk6JSn-66XMxr-dtJo2P-8r5UNg-6W4vdG-dsRJUS-aqZusD-aeqqKz-2q2hfe-6JK8uA-6RowYE-6RowWG-kScCGB-2SrLUs-vHACN-6dNDEG-6yFczC-5FJZyd-3xW445-7iP7ML-793Rdc-5r7hub-5nqw4G-crsV1Q-fJttK2-66FM23-dWPowy-518Emy-dE5gE8-68QxHV-nrMpfE" target="_blank">heipei</a>_

<div data-animation="no-animation" data-icons-animation="no-animation" data-overlay="" data-change-size="" data-button-size="1" style="font-size:1em;display:none;" class="supsystic-social-sharing supsystic-social-sharing-package-flat supsystic-social-sharing-content supsystic-social-sharing-content-align-center">
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter mail" target="_blank" title="Mail" href="#" data-nid="16" data-pid="1" data-post-id="169" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-paper-plane"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter facebook" target="_blank" title="Facebook" href="http://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.adambourg.com%2F2015%2F09%2F24%2Fthoughts-for-thursday-lazy-rebasing%2F" data-nid="1" data-pid="1" data-post-id="169" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-facebook"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter twitter" target="_blank" title="Twitter" href="https://twitter.com/share?url=http%3A%2F%2Fwww.adambourg.com%2F2015%2F09%2F24%2Fthoughts-for-thursday-lazy-rebasing%2F&text=Thoughts+for+Thursday%3A+Lazy+rebasing" data-nid="2" data-pid="1" data-post-id="169" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-twitter"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter linkedin" target="_blank" title="Linkedin" href="https://www.linkedin.com/shareArticle?mini=true&title=Thoughts+for+Thursday%3A+Lazy+rebasing&url=http%3A%2F%2Fwww.adambourg.com%2F2015%2F09%2F24%2Fthoughts-for-thursday-lazy-rebasing%2F" data-nid="13" data-pid="1" data-post-id="169" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-linkedin"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter reddit" target="_blank" title="Reddit" href="http://reddit.com/submit?url=http%3A%2F%2Fwww.adambourg.com%2F2015%2F09%2F24%2Fthoughts-for-thursday-lazy-rebasing%2F&title=Thoughts+for+Thursday%3A+Lazy+rebasing" data-nid="6" data-pid="1" data-post-id="169" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-reddit"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
</div>