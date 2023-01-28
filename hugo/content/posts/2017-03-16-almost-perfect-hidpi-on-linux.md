---
author:
  display_name: afiestas
  email: afiestas@kde.org
  first_name: Àlex
  last_name: Fiestas
  login: afiestas
categories:
  - Software Libre
  - KDE
  - Linux
  - Desktop
date: "2017-03-16T00:00:00Z"
published: true
tags:
  - kde
  - software libre
  - linux
  - desktop
  - hidpi
aliases:
  - /almost-perfect-hidpi-on-linux
slug: "almost-perfect-hidpi-on-linux"
title: Almost perfect HiDPI experience on Linux (Xorg)

---

[![Awesome HiDPI on Xorg][2]][1]

[1]: https://cdn.afiestas.org/posts/2017/02/hidpi_big.png
[2]: https://cdn.afiestas.org/posts/2017/02/hidpi_small.png

In 2013 I bought a Macbook Pro 13” which came with a HiDPI display (also known as retina display). Already back then the support for
a single HiDPI display was quite alright with KDE4 and a few tweaks here and there. Months later Qt5 got native HiDPI support and most
applications switched from GTK2 to GTK3 and finally the outliers (chromium based apps, godot, arduino...) got support for higher DPIs as well.

This would have meant perfect support for HiDPI on linux already in 2015 or so but we are missing one important thing which is supporting
both HiDPI and normal DPI screens at the same time. In order to support HiDPI screens applications need to render themselves bigger than
they used to, how much bigger depends on the screen pixel density which, for example, in the case of my laptop is from 1.75 to 2 times
bigger.

This means that applications rendered for HiDPI look huge on normal screens:

#### HiDPI File dialog on regular screen

[![Open dialog looking huge][4]][3]

[3]: https://cdn.afiestas.org/posts/2017/02/external_noscale_big.png
[4]: https://cdn.afiestas.org/posts/2017/02/external_noscale_small.png

#### Scaled HiDPI File dialog on regular screen

[![Open dialog looking ok][6]][5]

[5]: https://cdn.afiestas.org/posts/2017/02/external_scaled_big.png
[6]: https://cdn.afiestas.org/posts/2017/02/external_scaled_small.png

Here is where the internet seems to tell you that there is nothing to do but wait until Wayland arrives and saves us all
(I can’t wait for that btw) but that’s actually not true, X can do it.

XRandR allows us to apply transformations on the outputs, like for example rotation, and it also allows us to scale the screens.
Scaling the screens means that X will virtually increase the amount of pixels available in the display and automatically adapt the final
image size to the actual output resolution. For example:

If a 2x2 scale transformation is applied to a 1920x1080 screen it will be seen as a 3840x2160 screen by the applications but X will magically cut that in half before sending
the image to the monitor. So we have effectively turned our normal density screen into HiDPI.

This is an example of how the xrandr command line looks like:

```
xrandr --output eDP1 --auto --output DP1 --auto --scale 2x2 --right-of eDP1
```

This will set DP1 to the default mode, scale it by 2 and place it at the right of the HiDPI laptop screen (eDP1).

_Wow_! _Awesome_! This is so cool! Why is everybody not doing this? Where is the catch? \\
Mostly because of one bug: \\
<https://bugs.freedesktop.org/show_bug.cgi?id=39949>

If you read through the bug entry you will find a [patch](https://bugs.freedesktop.org/attachment.cgi?id=94929) created by Chris Wilson in 2014
which is shipped by default in some distributions but it has never been integrated into master.

If your distribution doesn’t ship with this patch by default (good for them!) you can build your own xorg-server, the patch should apply until 1.18 and for 1.19
you have a ported version [here](https://raw.githubusercontent.com/afiestas/xorg-server-patches/master/cursor.patch).

Although with this patch the experience is already way better since the applications will look correctly on all screens Qt has a few bugs
that will create weird glitches specially by placing windows where they don’t belong.

#### Drunk comboboxes

<iframe src='https://gfycat.com/ifr/NegativeReadyBluebird' frameborder='0' scrolling='no' allowfullscreen></iframe>
<iframe src='https://gfycat.com/ifr/MilkyTanFallowdeer' frameborder='0' scrolling='no' allowfullscreen></iframe>

#### Shy tooltips
<iframe src='https://gfycat.com/ifr/SlushyUnitedGrison' frameborder='0' scrolling='no' allowfullscreen></iframe>

#### Jumpy Drag And Drop
<iframe src='https://gfycat.com/ifr/DemandingFairBettong' frameborder='0' scrolling='no' allowfullscreen></iframe>

I have been working on 3 patches that solve most of these at least in my day to day use.

These two still need to be reviewed and might not get accepted:
<https://codereview.qt-project.org/#/c/182207/>
<https://codereview.qt-project.org/#/c/182392/>

This one seems to be on track to be merged (Drag and Drop):
<https://codereview.qt-project.org/#/c/182391/>

With all this patches the HiDPI experience in any modern Linux distro is as good as in macOS and the best part is that we do not have to wait until Wayland.
