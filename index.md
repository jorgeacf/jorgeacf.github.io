---
layout: page
---

<div class="blog-index" style="min-height: 400px;">  
  {% assign post = site.posts.first %}
  {% assign content = post.content %}
  {% include post_detail.html %}
</div>
-------
<p><b>Blog posts</b></p>

<ul class="posts">
  {% for post in site.posts %}
    <li>
		<span>{{ post.date | date_to_string }}</span> &raquo; <b><a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></b>
		
		{{post.excerpt}}
	</li>
  {% endfor %}
</ul>



