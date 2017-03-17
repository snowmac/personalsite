---
id: 254
title: 'Live and die by the keyboard: How to be more productive!'
date: 2016-01-28T06:00:26+00:00
author: adam.bourg@gmail.com
layout: post
guid: http://www.adambourg.com/?p=254
permalink: /2016/01/28/use-aliases/
snap_isAutoPosted:
  - "1"
snap_MYURL:
  - ""
snapEdIT:
  - "1"
snapFB:
  - 's:280:"a:1:{i:0;a:9:{s:4:"doFB";s:1:"1";s:8:"postType";s:1:"A";s:10:"AttachPost";s:1:"2";s:10:"SNAPformat";s:51:"New post (%TITLE%) has been published on %SITENAME%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:11:"isPrePosted";s:1:"1";}}";'
snapLI:
  - 's:289:"a:1:{i:0;a:9:{s:4:"doLI";s:1:"1";s:8:"postType";s:1:"A";s:10:"SNAPformat";s:41:"New post has been published on %SITENAME%";s:11:"SNAPformatT";s:18:"New Post - %TITLE%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";s:11:"isPrePosted";s:1:"1";}}";'
image: /wp-content/uploads/2016/01/2117746551_0b45d97535_b-825x510.jpg
categories:
  - git
  - productivity
  - thoughts
  - thursday
tags:
  - aliases
  - git
  - sublime
  - zsh
---
I live and die by the keyboard. The keyboard is my friend and it&#8217;s way faster to use an application using a keyboard then it is to use a mouse. In fact there are many <a href="http://dl.acm.org/citation.cfm?id=1978942.1979351&coll=DL&dl=GUIDE" target="_blank">studies</a> that show that for non-complex key combinations keyboard shortcuts and aliases are much faster then using the mouse.<!--more-->

**Git Aliases**

If you&#8217;re a Git addict like me, you should know about <a href="http://gitready.com/intermediate/2009/02/06/helpful-command-aliases.html" target="_blank">git</a> <a href="http://githowto.com/aliases" target="_blank">configuration</a>. This allows you to create shortcuts to common things that you use often. In my home directory, I have a .gitconfig file with the following contents:

> [alias]
  
> st = status
  
> ck = checkout
  
> ckb = checkout
  
> sta = stash apply
  
> sth = stash

While small, I find the things I most often do in git is switch branches, git status and modifying stashes.

**Zsh Aliases / Command line aliases**

Another source of aliases I use is for <a href="http://zsh.sourceforge.net/Intro/intro_8.html" target="_blank">Zsh</a> _(Zee Shell)_, for this you can do the following:

> alias commandShortCut = &#8220;commandToRun&#8221;

One nasty one I often have to run is to drop the local database in rails, recreate it and seed it with data. This is very long and a pain to type often:

> bundle exec rake db:drop db:create db:migrate db:seed;

My shortcut command for this is:

> ber

To set &#8220;ber&#8221; I used:

> alias ber=&#8221;bundle exec rake db:drop db:create db:migrate db:seed;&#8221;

**Sublime Aliases**

In <a href="https://www.sublimetext.com/" target="_blank">Sublime</a> Aliases are known as Snippets. <a href="http://docs.sublimetext.info/en/latest/extensibility/snippets.html" target="_blank">Snippets</a> are used as apart of the code complete portion of sublime.

To create a snippet in sublime, go to Tools > New Snippet. From there it&#8217;ll give you a template to work with:

> <snippet>
  
> <content><![CDATA[
  
> Hello, ${1:this} is a ${2:snippet}.
  
> ]]></content>
  
> <!&#8211; Optional: Set a tabTrigger to define how to trigger the snippet &#8211;>
  
> <!&#8211; <tabTrigger>hello</tabTrigger> &#8211;>
  
> <!&#8211; Optional: Set a scope to limit where the snippet will trigger &#8211;>
  
> <!&#8211; <scope>source.python</scope> &#8211;>
  
> </snippet>

It&#8217;s basically XML or HTML, uncomment the tab trigger and customize what you want to use to tab complete to auto fill in. Within the CDATA part, right where hello is, that is where you can put a tab completed item. Scope allows you to control what document scope you will trigger the snippet in.

Here&#8217;s an example I use for lorem ipsum text, the file is saved at &#8220;packages/users&#8221; within the sublime library as lorem.sublime-snippet:

> <snippet>
  
> <content><![CDATA[
  
> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vehicula blandit neque, nec ullamcorper leo hendrerit pretium. Morbi turpis risus, finibus sodales velit a, sagittis pharetra nibh. Nullam ultrices dolor in dolor mattis, imperdiet facilisis velit sagittis. Ut dapibus eleifend felis quis consectetur. Aenean sodales lorem ac urna efficitur egestas. Vivamus nec posuere lorem, vitae feugiat quam. Praesent venenatis mattis libero, in dapibus mi molestie sed. Vestibulum mollis leo lorem. Suspendisse id consequat enim, et facilisis diam. Nullam mattis lectus ligula, ac suscipit dui elementum ut. Sed egestas laoreet rutrum. Curabitur vel ex id quam porta vestibulum. Sed hendrerit orci nisl, eu aliquet ante venenatis eu. Praesent vel dapibus velit, eget ultricies ex.
> 
> ]]></content>
  
> <tabTrigger>lorem</tabTrigger>
  
> </snippet>

There you have it, 3 really great examples of using aliases / snippets in git, sublime and zsh. Using these is sure to make your workflow faster and easier, especially on a Mac or Linux computer!

<a href="https://www.flickr.com/photos/krayker/2117746551/in/photolist-4e91gz-fxooHf-4ed3D9-rSZrT5-5bryUC-dNKSo8-oQKERs-4e91Kx-e5rft9-pnLtD-2zqacm-e4zq8-5CMJka-AoLEUE-boGvv-d7v2r-7FwY9q-9wVSam-hAFrTi-soWKhq-aeJ4GF-ks5jH8-5Fvxt6-t143U-Lzvcr-7wSitP-anutgy-x885xe-t7g3qi-rw5zYT-8QRtwc-4e93Tn-4Y6aTS-tp8uuR-rGQTG7-bBepyy-9HwuSD-4s3Jo2-6LK6hw-7oy99Q-4Y6bj5-nigmF-8BoVsx-4ed369-7PD4bK-4eepn5-4Y6buG-6CFdCM-6CFbCK-4hxHCK" target="_blank">Photo</a> by <a href="https://www.flickr.com/photos/krayker/" target="_blank">Karunakar Rayker</a> via <a href="https://www.flickr.com" target="_blank">Flickr</a>

<div data-animation="no-animation" data-icons-animation="no-animation" data-overlay="" data-change-size="" data-button-size="1" style="font-size:1em;display:none;" class="supsystic-social-sharing supsystic-social-sharing-package-flat supsystic-social-sharing-content supsystic-social-sharing-content-align-center">
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter mail" target="_blank" title="Mail" href="#" data-nid="16" data-pid="1" data-post-id="254" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-paper-plane"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter facebook" target="_blank" title="Facebook" href="http://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.adambourg.com%2F2016%2F01%2F28%2Fuse-aliases%2F" data-nid="1" data-pid="1" data-post-id="254" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-facebook"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter twitter" target="_blank" title="Twitter" href="https://twitter.com/share?url=http%3A%2F%2Fwww.adambourg.com%2F2016%2F01%2F28%2Fuse-aliases%2F&text=Live+and+die+by+the+keyboard%3A+How+to+be+more+productive%21" data-nid="2" data-pid="1" data-post-id="254" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-twitter"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter linkedin" target="_blank" title="Linkedin" href="https://www.linkedin.com/shareArticle?mini=true&title=Live+and+die+by+the+keyboard%3A+How+to+be+more+productive%21&url=http%3A%2F%2Fwww.adambourg.com%2F2016%2F01%2F28%2Fuse-aliases%2F" data-nid="13" data-pid="1" data-post-id="254" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-linkedin"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter reddit" target="_blank" title="Reddit" href="http://reddit.com/submit?url=http%3A%2F%2Fwww.adambourg.com%2F2016%2F01%2F28%2Fuse-aliases%2F&title=Live+and+die+by+the+keyboard%3A+How+to+be+more+productive%21" data-nid="6" data-pid="1" data-post-id="254" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-reddit"></i>
  
  <div class="counter-wrap standard">
    <span class="counter">1</span>
  </div></a>
</div>