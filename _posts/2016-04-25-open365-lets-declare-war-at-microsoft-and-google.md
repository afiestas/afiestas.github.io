---
layout: post
title: open365, let's declare war at Google and Microsoft
categories:
- Software Libre
- KDE
- Libreoffice
- seafile
tags: [kde, android, software libre, libreoffice, kontact]
type: post
published: true
author:
  login: afiestas
  email: afiestas@kde.org
  display_name: afiestas
  first_name: Àlex
  last_name: Fiestas
---

[Open365](https://open365.io/){:target="_blank"} is a public and/or private cloud designed to compete with the likes
of Google Drive or Office365 by leveraging all the best free software out there.

The service is designed to scale horizontally as well as to be resilient to components crashing or going crazy. In
order to achieve this we have implemented a microservice architecure that communicate using a bus ([rabbitmq](https://www.rabbitmq.com){:target="_blank"}) plus some
other tricks so we can scale using commodity hardware horizontally. Nothing fancy, nothing revolutionary but it had to
be done :)

Finally, we've integrated under the same system very well know software solutions for File sinchronization,
PIM (Email, calendar,contacts...) and office.

**Specifically**

* [Seafile](https://www.seafile.com/en/home/){:target="_blank"}
* [Kontact](https://www.kde.org/applications/office/kontact/){:target="_blank"}
* [Libreoffice](https://www.libreoffice.org/){:target="_blank"}

For the last two, we re using [SPICE](http://www.spice-space.org){:target="_blank"} and our [HTML5/Javascript](https://github.com/eyeos/spice-web-client){:target="_blank"} client to run those applications in the server and send only the interface to the Web browser
in a really efficient way.

## This is how it looks like:
<iframe width="560" height="315" src="https://www.youtube.com/embed/2Xqn14OtcuQ" frameborder="0" allowfullscreen></iframe>


## Status
The public service is in open beta so you can go to [Open365](https://open365.io/){:target="_blank"} and try it out for free.

As I write this blogpost we are working hard to release all the code as **free software**. There is a lot to be done before we can
release all the code such as: creating a simple installer, preparing documentation and accomodating the new repositories to our CI.

We expect to release everything within days, but it will be done when it is done :)

Cheers!
