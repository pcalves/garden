---
layout: page
id: home
---

<article>
<section>
{% if site.notes.last %}
<h1>Latest</h1>

<blockquote>
<h2>{{ site.notes.last.title }}</h2>

<p class="time">
<time datetime="{{ sites.notes.last.last_modified_at | date_to_xmlschema }}">
Last updated {{ site.notes.last.last_modified_at | date: "%B %-d, %Y" }}
</time>
</p>

<p>{{ site.notes.last.excerpt | markdownify | strip_html | truncatewords: 50 }}</p>
<p><a class="internal-link" href="{{ site.notes.last.url }}">Read more</a></p>
</blockquote>
{% endif %}

<hr/>

{% assign tags = site.notes | map: 'tags' | join: ' '  | split: ' ' | uniq | sort %}
{% if tags.size > 0 %}
<h1>Topics</h1>

<div>
{% for tag in tags %}
{% unless tag == "people" or tag == "books" or tag == "clippings" or tag == "notes" %}
<a class="tag" href="/tags/{{tag}}" target="_self">{{ tag | replace: "-", "&nbsp;" }}</a>{% unless forloop.last %}, {% endunless %}
{% endunless %}
{% endfor %}
</div>
{% endif %}

<hr/>

<h1>Notes</h1>
{% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" |reverse %}
{% for note in recent_notes %}
{% unless note.tags and (note.tags contains "people" or note.tags contains "books" or note.tags contains "clippings") %}
<p>
<a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a>
</p>
{% endunless %}
{% endfor %}
name | remove: '.md'
<hr/>

<h1>Links</h1>
{% assign links = site.notes | where_exp: "note", "note.tags contains 'clippings'" | sort: "last_modified_at_timestamp" |reverse %}
{% for note in links %}
<p>
<a href="{{ note.source }}">{{ note.title }}</a>
</p>
{% endfor %}
</section>
</article>