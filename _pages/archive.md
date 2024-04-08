---
layout: page
title: Archive
---
<ul class="archive">
{% for note in site.notes %}
<li>
{% if note.source != nil %}
<a href="{{ note.source }}">{{note.title}}</a>{% if note.author.length > 0 %} by {{note.author}}{% endif %} <span>({{ note.last_modified_at | date: "%B %Y" }})</span></li>
{% else %}
<a href="{{ note.url }}{%- if site.use_html_extension -%}.html{%- endif -%}" class="internal-link">{{note.title}}</a>{% if note.category != null %} in {{note.category}}{% endif %} <span>({{ note.last_modified_at | date: "%B %Y" }})</span><p>{{ note.excerpt | strip_html | truncate: 60, "..." }}</p></li>
{% endif %}
{% endfor %}
</ul>
