---
title: "I made a blog!"
tags:
  - blog
---

I have long been thinking about starting a technical blog. I often tinker with
projects of different kinds, and it'd be nice to share some of those things
with the rest of the world. And if noone reads it, it's still good for me to
document for myself what I'm doing. :) Can't say it's only going to be technical
things though; I'll cover any subject that intrests me enough to make a blog
post about it.

It wasn't obvious to me what sort of platform that I would choose, but I ended
up hosting it on [github pages](https://pages.github.com/), generating it with
the help of [Jekyll](http://jekyllrb.com/). I really do enjoy the very simple
framework, since everything is basically text files that I keep track of in a
git repository. This means all I really need is emacs, and this works very well
for me with my newfound emacs love [spacemacs](http://spacemacs.org/). To publish,
all I really need to do is just `SPC g P u`!

Since Jekyll generates static pages, it's also really fast, secure and failsafe.
However, despite being static pages it generates very nice lookgin pages, not
much work is needed to get nice looking pages up when the overall framework is
setup. I write a short YAML-header containing the title and some tags, and then
the actual blog post in markdown. For example, the YAML header for this blog
post looks like this:

{% highlight YAML %}
---
title: "I made a blog!"
tags:
  - blog
---
{% endhighlight %}

And the rest is just markdown. What did take way too much time though, was to
get everything to look like I wanted it to. I have basically zero experience of
web development, except for some very simple html (and I read a little on Ruby on
rails), so I decided to work from existing code. There are many ready made
themes for jekyll out there, and many were good, but I couldn't really find one
that I liked as the one for the Jekyll docuementation web page, so I ended up
modifyting that to work well for a blog instead.

What seemed to be the hardest to get to work properly is support for tags,
which I consider quite important for a blog platform. I managed to hack that
into this page by manually making very simple files in a tag folder, and when
I create a new tag, I just have to copy a template folder, rename it, and rename
one variable in one of its files. I might try to automate this one day, but I'm
very pleased about the tag selection in the right hand menu right now!

Jekyll also comes with its own development server, so I just need to

{% highlight bash %}
~ $ jekyll serve
{% endhighlight %}

to find my site on loopback port 4000, and it even regenerates pages
automatically when it senses that they have been changed.

There are still things I'd like to add though. For example, the site is currently
very text heavy, so it'd be nice with some sort of picture per post in the
overview. Also, it will currently list all blog posts in history on a single.
Not a problem right now, but will inevitably be one in time, so some sort of
system would be nice. And at that time it would probably be wise to add some
sort of archive functionality as well.

Also, it currently lists entire blog posts on the front page right now, and I'd
like to make it contain more like "teasers" that can be clicked for more in
depth reading. It would also be nice to add some sort of commenting system as
well.
