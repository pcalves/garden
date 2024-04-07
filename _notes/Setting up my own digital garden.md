---
type:
  - "[Notes](Notes.md)"
tags:
  - notes
  - digital-gardens
created: 2024-03-28
share: true
---

Once upon a time, I published a semi-public wiki powered by vimwiki and hosted it on https://wiki.pcalv.es/.

Now that I'm back on Obsidian, I want to do it again. [Working with the garage door up](../Working%20with%20the%20garage%20door%20up.md) and allowing others to peek into my collection of clippings, thoughts, etc. 

There's a few ways this can be accomplished. 

The easy one is to use [Obsidian Publish](https://obsidian.md/publish). It should Just Work, the monthy fee is pretty acceptable and publishing is integrated into the app. Easy. Boring? Possibly. I'd rather try to roll my own solution.

Here's a couple of promising tutorials:
- [Setting up your own digital garden with Jekyll](./Clippings/Setting%20up%20your%20own%20digital%20garden%20with%20Jekyll.md)
- [Obsidian Jekyll workflow](./Clippings/Obsidian%20Jekyll%20workflow.md)

After some hours spent trying to set up Ruby and all the required dependencies for Jekyll to run (see [2024-03-28](../2024-03-28.md) for fun [Interstitial Logs](Interstitial%20Logs.md)), I'm beginning to see the value of a turnkey solution. But I'm also too deep now to give up. Typical hacker stubborness: sunk cost isn't so much a fallacy as it is a rallying cry.

## Implementation details

Set up https://github.com/pcalves/garden using https://github.com/maximevaillancourt/digital-garden-jekyll-template as a starting point.

Removed the graph renderer and replaced all SASS by the same CSS used in https://pcalv.es.

[Github Publisher](https://github.com/ObsidianPublisher/obsidian-github-publisher) handles merging notes into the repo. I can set which notes should be published using a front matter attribute. Still left to be done:
- [x] Allow plugin to delete notes (requires setting ignored file paths)
- [x] Allow plugin to auto-merge to `main`
- [x] Make sure templates are all set up with the `share` attribute

My local notes include `People`, `Clippings` and `Books`. While I don’t want to publish these publicly, I want to be able to link to them in my notes. Each note of that type should have an external URL. How can I convert the wikilinks to external links when parsing my notes using Jekyll?

See a possible solution here: https://chenhuijing.com/blog/handling-articles-on-external-sites/#%F0%9F%91%BE

Alternatively, maybe I _do_ expose these notes, but make sure the front matter is rendered: https://forum.obsidian.md/t/a-frontmatter-that-finally-supports-links-lilas-frontmatter/53087

The main issue I’m trying to avoid is `Clipping` being mistaken for my own words. Archiving whole pages is powerful and something I intend to keep on doing, but re-publishing those under my own domain feels iffy, even if they are contextualized.