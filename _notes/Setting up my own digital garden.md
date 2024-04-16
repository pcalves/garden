---
type:
  - "[[Notes|Notes]]"
tags:
  - notes
  - digital-gardens
created: 2024-03-28
status: Many others have written at length about digital gardens. This is more about my own process of setting one up.
share: true
---

Once upon a time, I published a semi-public wiki powered by vimwiki and hosted it on https://wiki.pcalv.es/.

Now that I'm back on Obsidian, I want to do it again. [[Working with the garage door up|Working with the garage door up]] and allowing others to peek into my collection of clippings, thoughts, etc. 

There's a few ways this can be accomplished. 

The easy one is to use [Obsidian Publish](https://obsidian.md/publish). It should Just Work, the monthy fee is pretty acceptable and publishing is integrated into the app. Easy. Boring? Possibly. I'd rather try to roll my own solution.

Here's a couple of promising tutorials:
- [[Setting up your own digital garden with Jekyll|Setting up your own digital garden with Jekyll]]
- [[Obsidian Jekyll workflow|Obsidian Jekyll workflow]]

After some hours spent trying to set up Ruby and all the required dependencies for Jekyll to run (see [[2024-03-28|2024-03-28]] for fun [[Interstitial Logs|Interstitial Logs]]), I'm beginning to see the value of a turnkey solution. But I'm also too deep now to give up. Typical hacker stubborness: sunk cost isn't so much a fallacy as it is a rallying cry.

## Implementation details

Set up https://github.com/pcalves/garden using https://github.com/meewgumi/green-web-template as a starting point. This is a fork of https://github.com/maximevaillancourt/digital-garden-jekyll-template with some nice QoL improvements, especially support for Obsidian images.

Removed the graph renderer and replaced the CSS by the one used in https://pcalv.es. It's been greatly expanded on since the initial import.

[Github Publisher](https://github.com/ObsidianPublisher/obsidian-github-publisher) handles merging notes into the repo. I can set which notes should be published using a front matter attribute.

My local notes include `People`, `Clippings` and `Books`. While I don’t want to publish these publicly, I want to be able to link to them in my notes. Each note of that type should have a `source` URL. Jekyll will display those as external links, and avoid linking to its pages.

Larger notes can become a bit unwieldy to navigate. I want a ToC in the style of [[Maggie Appleton|Maggie Appleton]]'s, see [this article](https://maggieappleton.com/nontechnical-gardening) for a good example.

https://github.com/allejo/jekyll-toc looks like a great solution: zero dependencies, just drag and drop into your own project.