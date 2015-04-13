---
layout: page
title: Jorge Figueiredo
tagline: Supporting tagline
---
{% include JB/setup %}


<p><b>Blog posts</b></p>

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>



