---
layout: page
title: Welcome! 🥬
id: home
---

# Latest

> # {{ site.notes.last.title }}
> 
> <time datetime="{{ sites.notes.last.last_modified_at | date_to_xmlschema }}">
>   {{ site.notes.last.last_modified_at | date: "%Y-%m-%d" }}
> </time>
> 
> {{ site.notes.last.content | markdownify | strip_html | truncatewords: 50 }}
> 
> <a class="internal-link" href="{{ site.notes.last.url }}">Read more</a>

# Topics

{% assign tags = site.notes | map: 'tags' | join: ' '  | split: ' ' | uniq | sort %}
{% for tag in tags %}
<div style="display: inline"><a class="tag" href="#{{tag}}" target="_self">{{ tag | replace: "-", "&nbsp;" }}</a>,</div>
{% endfor %}

# Recent notes
{% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" |reverse %}
{% for note in recent_notes %}
{{ note.last_modified_at | date: "%Y-%m" }} - <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a>
{% endfor %}