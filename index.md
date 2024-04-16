---
layout: page
id: home
---

<article>
<section>

Hi! This is my digital garden. Think of it as a personal wiki of sorts, a place to write about subjects of personal interest, to gather links and notes and to make new and unexpected connections. Feel free to poke around.

<hr>

<h1>Topics</h1>

<div class="tags">
{% for tag in site.tags %}
<a class="tag" href="/tags/{{tag.slug}}" target="_self">{{ tag.title }}</a>
{% endfor %}
</div>

<hr/>

<h1>Notes</h1>
{% assign recent_notes = site.notes | sort: "created" |reverse %}
{% for note in recent_notes %}
{% unless note.tags and (note.tags contains "people" or note.tags contains "books" or note.tags contains "clippings") %}
<p class="list-time">
<time datetime="{{ note.created | date_to_xmlschema }}">
{{ note.created | date: "%m / %Y" }} – 
</time>
<a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a>
</p>
{% endunless %}
{% endfor %}

<hr/>

<h1>Links</h1>
{% assign links = site.notes | where_exp: "note", "note.tags contains 'clippings'" | sort: "created" | reverse %}
{% for note in links %}
<p class="list-time">
<time datetime="{{ note.created | date_to_xmlschema }}">
{{ note.created | date: "%m / %Y" }} –
</time>
<a href="{{ note.source }}">{{ note.title }}</a>
</p>
{% endfor %}
</section>
</article>