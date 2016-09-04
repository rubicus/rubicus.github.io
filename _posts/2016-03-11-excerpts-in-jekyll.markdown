---
title: Excerpts in jekyll
tags:
  - jekyll
---

I'm probably putting way to much time into trying to make this blog look exactly
like I want it to, but one issue I've had was to create the front page of the blog.
I do want some of each blog post to be visible to anyone visiting the front page,
so that it's easy to get and idea on what that post is about. At the same time, having
each whole post  on the front page would be too much, and you'd have to scroll a lot
if you're just trying to get an overview the blog or trying to find something
you're interested in. The answer to this problem is excerpts, and this blog post
is going to be about these (and also utilizes them).

What i initially tried to do was use the truncatewords filter in liquid, like so:

{% highlight liquid %}
{% raw %}
{{ post.content | truncatewords: 60 }}
{% endraw %}
{% endhighlight %}

<!--more-->

However, this has a big problem. In case the post contains any html
tags of any kind (which it almost certainly does), these are also part of the
part being truncated. If any starting tag comes within the limit and the ending
tag outside it, there is a problem. There is the option of stripping the post
of all html first with `strip_html`, but I do not want to do that, since it
would mess with links, code highlighting and so on, and would genereally just
not look nice enough.

Luckily, there is a feature for this in jekyll! By defining a value for
`excerpt_separator` in your `_config.yml` you can then use that separator
(prefarably some sort of html comment, so it doesn't show up in your posts)
to manually declare where you want the excerpt to end for each post. I find
this to be the best sollution. When I want to include the excerpt in my include
files, I then only have to write

{% highlight liquid %}
{% raw %}
{{ post.excerpt }}
{% endraw %}
{% endhighlight %}

Just don't forget to add some sort of link to the actual blog post, so noone
mistakes your excerpt for just being a really short post! :)
