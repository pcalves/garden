---
type:
  - "[[Notes|Notes]]"
tags:
  - software
  - open-source
created: 2024-04-22
status:
  - Epistemic status. Can default to "Placeholder".
share: true
---

Talking with [[Herman Martinus|Herman Martinus]] about analytics on Bear, I found myself wanted to store _only_ one bit of data: the [HTTP referer](https://en.wikipedia.org/wiki/HTTP_referer).

I don't care how many people have visited by blog, but I care where they came from.

Thus, my ideal analytics would probably look something like this:

| Page            | Refererrs                       |
| --------------- | ------------------------------- |
| /some-blog-post | - bearblog.dev<br> - google.com |

Unique referrers would be stored and displayed alphabetically.

By default, [Bear Blog uses CSS to trigger analytics](https://herman.bearblog.dev/how-bear-does-analytics-with-css/) with the following bit of code:

```css
body:hover {
    border-image: url("/hit/{{ post.id }}/?ref={{ request.META.HTTP_REFERER }}");
}
```

All I need to figure out is, what's the easiest possible way to store this data? I don't need to make it private, I really just need the barest of databases and HTML to make it look presentable.

[[Herman Martinus|Herman Martinus]] got back with an easy enough solution:

> Yeah, I reckon that'd be easy enough to do. You can set up an endpoint that just logs every referrer, then pop something like this in your blog's footer:  

```js  

if (document.referrer) {  

    const url = new URL("[https://example.com/log-referrer](https://example.com/log-referrer)");  

    url.searchParams.append("referrer", document.referrer);  

    fetch(url);  

}  
```