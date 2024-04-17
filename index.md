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
{% assign tags = site.tags | shuffle %}
{% for tag in tags %}
<a class="tag" href="/tags/{{tag.slug}}" target="_self">{{ tag.title }}</a>
{% endfor %}
</div>

<hr/>

<h1>Notes</h1>
<div>
{% assign notes = site.notes | shuffle %}
{% for note in notes %}
{% unless note.tags and note.tags contains "people" or note.tags contains "books" or note.tags contains "clippings" or note.tags contains "links" %}
<div class="note-link">
<p><a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a></p>
    <div class="tags tags-row">
    {% for tag in note.tags %}
    {% unless tag == 'notes' %}
    {% assign site_tag = site.tags | where: "slug", tag | first %}
    <a class="tag" href="/tags/{{ site_tag.slug }}" target="_self">{{ site_tag.title }}</a>
    {% endunless %}
    {% endfor %}
    </div>
</div>
{% endunless %}
{% endfor %}
</div>

<hr/>

<h1>Links</h1>
<div>
{% assign links = site.notes | where_exp: "note", "note.tags contains 'clippings' or note.tags contains 'links'" | shuffle %}
{% for note in links %}
<div class="note-link">
<p>
<a href="{{ note.source }}">{{ note.title }}</a>
</p>
    <div class="tags tags-row">
    {% for tag in note.tags %}
    {% unless tag == 'clippings' or tag == 'links' %}
    {% assign site_tag = site.tags | where: "slug", tag | first %}
    <a class="tag" href="/tags/{{ site_tag.slug }}" target="_self">{{ site_tag.title }}</a>
    {% endunless %}
    {% endfor %}
    </div>
</div>
{% endfor %}
</div>
</section>
</article>