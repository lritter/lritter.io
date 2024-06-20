---
Type: Page
Location: /projects
Title: Some things I have worked on
---

## Dotfiles

I host all my [dotfiles on github](https://github.com/lritter/dotfiles). Some of the interesting functions are those for [setting up GitHub tokens](https://github.com/lritter/dotfiles/blob/master/bin/setup_github_security_token.sh) (or similar) and [putting them into the environment](https://github.com/lritter/dotfiles/blob/master/bash/bash_env#L68) using macOS Keychain. This helps keep sensitive information out of dotfiles.

## Ancient History

Here are some of my favorite projects from the ancient past.

### Interactive Cutaway Illustrations
<img class="right_margin_item" src="/media/projects/wheelneck.png" style="height: 124.8px;"/>

A system for authoring and viewing interactive cutaway illustrations of complex 3D models using conventions of traditional scientific and technical illustration.

{%  include citation.html
    title="Interactive Cutaway Illustrations of Complex 3D Models"
    href="http://vis.berkeley.edu/papers/cutaways/"
    author="Wilmot Li, Lincoln Ritter, Maneesh Agrawala, Brian Curless, David Salesin"
    publication="SIGGRAPH 2007, August 2007"
%}

### Painting with Texture
<img class="right_margin_item" src="/media/projects/tree-result-thumbnail.png" style="height: 140.4px;"/>

An interactive texture painting system that allows the user to author digital images by painting with a palette of input textures.

{%  include citation.html
    title="Painting with Texture"
    href="http://grail.cs.washington.edu/projects/painting-with-texture/"
    author="Lincoln Ritter, Wilmot Li, Maneesh Agrawala, Brian Curless, and David Salesin"
    publication="17th Eurographics Symposium on Rendering, Nicosa, Cyprus, June 26th-28th, 2006"
%}


### Loud Networks

<img class="right_margin_item" src="/media/projects/loud_networks_screenshot.png" style="height: 171.6px; border:0; padding: 0;"/>

As a class project for CSE 561 (Fall 2005) our team built a full wireless network stack using sound as the transmission  medium. We were able to achieve reliable communication at distances of up to 15 feet in noisy environments at 160 bits per second. We were able to maintain 50% medium usage under high load using our novel congestion control mechanism.

{%  include citation.html
    title="Loud Networks"
    href="/media/projects/LoudNetworks561.doc"
    author="J Carlson, J Froehlich, L Ritter"
    publication="Fall, 2005"
%}