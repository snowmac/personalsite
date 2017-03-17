---
id: 44
title: Secure credential storage
date: 2015-08-11T07:30:44+00:00
author: adam.bourg@gmail.com
layout: post
guid: http://www.adambourg.com/?p=44
permalink: /2015/08/11/secure-credential-storage/
snap_isAutoPosted:
  - "1"
snap_MYURL:
  - ""
snapEdIT:
  - "1"
snapLI:
  - 's:537:"a:1:{i:0;a:13:{s:11:"isPrePosted";s:1:"1";s:8:"isPosted";s:1:"1";s:4:"pgID";s:19:"6036778049926615040";s:7:"postURL";s:124:"https://www.linkedin.com/updates?discuss=&amp;scope=24020705&amp;stype=M&amp;topic=6036778049926615040&amp;type=U&amp;a=WJrM";s:5:"pDate";s:19:"2015-08-11 08:00:45";s:4:"doLI";s:1:"1";s:8:"postType";s:1:"A";s:10:"SNAPformat";s:41:"New post has been published on %SITENAME%";s:11:"SNAPformatT";s:18:"New Post - %TITLE%";s:9:"isAutoImg";s:1:"A";s:8:"imgToUse";s:0:"";s:9:"isAutoURL";s:1:"A";s:8:"urlToUse";s:0:"";}}";'
image: /wp-content/uploads/2015/08/14890125691_ea31916a81_o-746x510.jpg
categories:
  - hipaa
tags:
  - 12 factor
  - devops
  - factor 12
  - phi
  - security
---
A couple of weeks I reviewed a pull request from one of our consultants. It contained a set of credentials to authenticate to a health API which could obtain production PHI. That information was stored in source control in plain text.<!--more-->

After escalation of the issue we got the it resolved and we&#8217;re now loading the passwords through a secure system. This got me thinking about how other people approach security.

Storing credentials in source control is a bad idea, especially if it can obtain PHI or user information. So you need to store a set of credentials or keys to access an API or service but you shouldn&#8217;t store it in source control. Why not?

  * Anyone with access to your source can see it.
  * Any disgruntled employee can see it who has access to the source.
  * If your source is publicly available, they could see it
  * if your source is stored on an unencrypted device, people could obtain the source and the credentials.
  * Social engineering could occur for a team mate to send the credentials from the source to an attacker.

Some of these might be far flung scenarios, but hackers have a way of getting what they want. Anthem was hacked earlier this year (In February 2015) by a social engineering attack.

But I need to access the service! You have some choices:

  1. Encrypt the credentials and store it in a file in source control. 
      * Ensure that the decryption key is not stored in source control. This is more secure because it allows the users of the app to do their work but it prevents anyone with access to the source code total access to the credentials. However depending on the encryption and how much time they have it can be broken.
  2. Configure the credentials to be stored in a config file that gets loaded into an system environment variable when the system boots which is available to the source code. 
      * Downside is if on a shared host it could expose the information to other system users.
  3. Load the credentials into a secure key management system. 
      * Options include SafeNet and Amazon&#8217;s CloudHSM. 
          * Cons can be cost, access and integration. For a Rails project we worked on we have to build a custom gem to integrate with SafeNet and the approval process took almost 8 months.
  4. Load the credentials into a local keychain 
      * If the local system has something like the Mac&#8217;s Keychain, storing it there might be a way to ensure you can use the credentials without risking data breach.

I personally choose SafeNet whenever possible. I think it&#8217;s the most robust and it ensures that the system won&#8217;t get hacked. If someone had access to the code, but were not authorized to access SafeNet, the keys would not be available to the attacker.

_Photo provided by <a href="https://www.flickr.com/photos/befuddledsenses/14890125691/in/photolist-oFMMB2-72xiQ7-rHGUvU-892XCK-e3qsFM-9h1Zgc-8pqb2e-pdHFcc-2JZJSr-qBtgR4-9cuiGG-nKtnb6-Hp82w-iB5dCr-7SDe1g-36uAXJ-qAmNBP-gBqsLF-9qewys-sUXDEq-aaLV9A-9hAXJ9-8UosBX-qwgLos-6Xj21U-91jm86-pdubeu-4Cy11W-fdAxzX-4nEGkM-iZ3Wkr-o1ApPq-69YLzC-byaV2J-dZgQWe-cKwP4b-9ponLA-8bgazq-9AkHjh-F4fUP-qnNFao-8HWji2-fkFYh2-eGmSd7-2RpRBq-dckdjj-quR4Bg-eGmRo5-9wwSAb-dXH26e" target="_blank">Luke Jones via Flickr</a>._

<div data-animation="no-animation" data-icons-animation="no-animation" data-overlay="" data-change-size="" data-button-size="1" style="font-size:1em;display:none;" class="supsystic-social-sharing supsystic-social-sharing-package-flat supsystic-social-sharing-content supsystic-social-sharing-content-align-center">
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter mail" target="_blank" title="Mail" href="#" data-nid="16" data-pid="1" data-post-id="44" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-paper-plane"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter facebook" target="_blank" title="Facebook" href="http://www.facebook.com/sharer.php?u=http%3A%2F%2Fwww.adambourg.com%2F2015%2F08%2F11%2Fsecure-credential-storage%2F" data-nid="1" data-pid="1" data-post-id="44" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-facebook"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter twitter" target="_blank" title="Twitter" href="https://twitter.com/share?url=http%3A%2F%2Fwww.adambourg.com%2F2015%2F08%2F11%2Fsecure-credential-storage%2F&text=Secure+credential+storage" data-nid="2" data-pid="1" data-post-id="44" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-twitter"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter linkedin" target="_blank" title="Linkedin" href="https://www.linkedin.com/shareArticle?mini=true&title=Secure+credential+storage&url=http%3A%2F%2Fwww.adambourg.com%2F2015%2F08%2F11%2Fsecure-credential-storage%2F" data-nid="13" data-pid="1" data-post-id="44" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-linkedin"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
  
  <a class="social-sharing-button sharer-flat sharer-flat-1 counter-standard without-counter reddit" target="_blank" title="Reddit" href="http://reddit.com/submit?url=http%3A%2F%2Fwww.adambourg.com%2F2015%2F08%2F11%2Fsecure-credential-storage%2F&title=Secure+credential+storage" data-nid="6" data-pid="1" data-post-id="44" data-url="http://www.adambourg.com/wp-admin/admin-ajax.php" data-action="" rel="nofollow"><i class="fa fa-fw fa-reddit"></i>
  
  <div class="counter-wrap standard">
    <span class="counter"></span>
  </div></a>
</div>