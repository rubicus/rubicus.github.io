---
title: Repairing my TV - part 1
tags:
  - repair
...

I finally bought a TV after contemplating it for a long time! Got a used 37''
LCD screen TV for what I considered to be a really good price. I used it for
maybe 2 hours and was very happy with it. Really good picture with clear colors,
nice blacks and, most importantly, it accpeted a 1080p input from my computer.

Sadly this didn't last for very long. Suddenly the pictured turned grey, and
became almost completely white, with the remaining picture having weird
rainbow-like colors, as can be seen in the picture below. This made me a bit
sad. However, I decided to not give up easily, and instead look forward to the
opportunity to be able to tear down and repair a TV. That process is what I will
be covering in this blog post.

<img src="/img/tv-repair/bad-gamma.jpg">

<!--more-->

So my first thought was that there might be some bad caps in the power supply,
so puting it face down on my sofa, I started to undo screws to have a closer
look.
After undoing 15-20 screws or so (an electric screwdriver would be nice), the
back finally came off, and I could inspect the power supply. Sadly (depending on
how you see it), all the caps looked completely fine. There wasn't the slightest
sign of any bulge on any of them that I could see, so likely I'd have to find
the problem elsewhere.

<img src="/img/tv-repair/psu.jpg">

To be on the safe side I decided to pick out my ground fault interrupter,
plug the TV in and measure the rails. To me they seem fine, although I'm not
certain about the tolerances that I have to play with here. I'm slightly
concerned about the 13 V rail measuring 12.4 V during load, so if I can't find
the problem elsewhere I might get back to that. Should be alright though I
think. I am having some trouble finding
a good reference for how big these can be though, so if anyone has any
good info on that, be sure to tell me! :)

<img src="/img/tv-repair/measure.jpg">

I don't think anything is wrong with the main board, since the tuner and all
inputs that I have tested have all worked fine, including menus. The problem
seems to affect the whole image regardless of input. I also tried fiddling
with the ribbon connectors, to see if there was any problem in there,
but that does not seem to be the case either. Also, since the issue
affects the whole picture more or less equally everywhere, I don't think
I'll find it within the panel itself either. The likely culprit
is therefore (according to me) the timer control board (the T-con board).

Now, I'd rather not replace the whole T-con board if I can avoid it.
A new one with shipping would cost me almost as much as I paid for the TV
itself. However, it turns out that I might be in luck. Reading up on Samsung
T-con boards I found out that it is fairly common for the gamma chip on these
(called AS15) to break. And that should render an image looking very much like
the one I get. To test this out, I measured the gamma test points on the
T-con board (see details
[here](http://www.badcaps.net/forum/showthread.php?t=35301)
on the badcaps.net forums), and to my delight some of the readings were way
off!

<img src="/img/tv-repair/tcon.jpg">

So now I've ordered a new chip, which was cheap. Hopefully, it will be enough
to just replace it. I have some fears that there might be something other that
is happening, causing the chip to break (like a faulty panel), but in many other
cases I've read about, switching out the chip has seamingly fixed the issue,
so my hopes are up. It comes in a 48 pin QFP, so it will not
be entirely easy to switch out, but I believe it should be doable. It doesn't
have an exposed back plate, so I shouldn't even need a heat gun for this.
But since I have to wait for the chip to arrive first, that will have to be
another blog post, for another time!
