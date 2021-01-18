---
date: 2021-01-05 21:04 
description: A detailed guide on customizing a website with the Publish framework.
tags: development
excerpt: Customize your Publish site in a few steps to get the most out of this framework.
topic: development
title: Customizing a Publish site
---

# Customizing your Publish site

Welcome back 👋. If you read my previous post you already have your Publish site up on Github Pages. If not... read this [Creating a website with Publish and Github Pages](https://www.joshuatwalsh.com/posts/publish-and-github-pages/)


Let's pick up where we left off. Our site is on Github Pages and now we want to make it look 👌. 

Here is what we're going to do:

1. Define our HTMLFactory
2. Add Nodes and resources for styling
3. Create a new theme

## 1. Defining our own HTML Factory

Create a new file in `Sources`/`<SiteName>` called `HTMLFactory.swift`. This is where we'll add the methods required from the `HTMLFactory` protocol.

Start typing _makeIndexHTML_ and Xcode should auto-complete this method for you.

```
func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML
```
As the docs state, this creates the HTML to use for the website's main index page. First, we need to change this part `PublishingContext<Site>` to use your `site` name. For example: `PublishingContext<SwiftBySundell>` 😉. This is the name of your site that is in `main.swift`. Or the struct that conforms to `Website`.

Let's go ahead and add the rest of the methods for `HTMLFactory` and we'll add to them later on.

```
func makeSectionHTML(for section: Section<SiteName>, context: PublishingContext<Site>) throws -> HTML
func makeItemHTML(for item: Item<SiteName>, context: PublishingContext<Site>) throws -> HTML
func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML
func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML?
func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML?
```

Again, don't forget to change `Site` to your site name. 

## 2. Adding Nodes to use in our HTMLFactory

Create a new folder in `Sources/<SiteName>/` called `Nodes`. Then add a new file in that folder called `Node+Head.swift` In fact, to save some time we're going to just add all the files we need and go through them one by one. Here is what your project folder structure should look like when you're done.

```
- Sources
    - SiteName
        - Nodes
            - Node+Head.swift
            - Node+Header.swift
            - Node+Grid.swift
            - Node+Footer.swift
            - Node+Page.swift
            - Node+PageContent.swift
            - Node+PageExcerpt.swift
            - Node+Post.swift
            - Node+Posts.swift
            - Node+Sidebar.swift
            - Node+Taglist.swift
        - main.swift
        - HTMLFactory.swift
```

Ok, that seems like a lot, but we'll go through each one by one. We're going to define our `Head` for our site. This is where we link any stylesheets or other metadata for a typical HTML site, and we'll do the same here. I'm using a CSS framework called [Pure.css](https://purecss.io) as boilerplate styling for my site. You can do the same, or go on your own adventure. Here is what our `Node+Head.swift` file should look like:

### Head

```
import Plot

extension Node where Context == HTML.DocumentContext {
    static func head(for site: <SiteName>) -> Node {
        return Node.head(
            .title("\(site.name) - \(site.description)"),
            .meta(
                .charset(.utf8),
                .name("viewport"),
                .content("width=device-width, initial-scale=1")
            ),
            .link(
                .rel(.stylesheet),
                .href("https://unpkg.com/purecss@1.0.1/build/pure-min.css"),
                .init(name: "integrity", value: "sha384-oAOxQR6DkCoMliIh8yFnu25d7Eq/PHS21PClpwjOTeU2jRSq11vu66rf90/cZr47"),
                .init(name: "crossorigin", value: "anonymous")
            ),
            .link(
                .rel(.stylesheet),
                .href("https://unpkg.com/purecss@2.0.3/build/grids-responsive-min.css")
            ),
            .link(
                .rel(.stylesheet),
                .href("/Pure/styles.css") // We'll add this next
            )
        )
    }
}
```

There is a file we haven't added yet - `styles.css`. Add a folder in `Resources/` called `Pure`. Then add a file called `styles.css`. This will be your styles you want to override from `Pure`. Also if you're confused about this part:

```
.link(
.rel(.stylesheet),
.href("https://unpkg.com/purecss@1.0.1/build/pure-min.css"),
.init(name: "integrity", value: "sha384-oAOxQR6DkCoMliIh8yFnu25d7Eq/PHS21PClpwjOTeU2jRSq11vu66rf90/cZr47"),
.init(name: "crossorigin", value: "anonymous")
),
```
This comes directly from the `Pure.css` site. We shouldn't need to touch this file much, or at all after setting it up. 
One down...ten to go...

Let's move on to `Node+Header.swift`. In each of our remaining `Node+` files we'll be importing `Plot` and extending `Node` like so:
```
import Plot

extension Node where Context == HTML.BodyContext
```

I'll just be showing the contents of the extension going forward. Here is what our `Header` will look like:

***I'll call out any important notes.***

### Header

```
static func header(for site: <SiteName>) -> Node {
    return .div(
        .div(
            .class("pure-menu pure-menu-horizontal pure-u-1-1 top-header"),
            .a(
                .class("pure-menu-heading"),
                .text(site.title),
                .href("/")
            )
        )
    )
}
```
***NOTE***
Each `.div`, `.class`, `.a`, etc corresponds to an HTML node. You'd normally see these written out like so:

```
<div class="pure-menu pure-menu-horizontal pure-u-1-1 top-header">
    <a class="pure-menu-heading" href="/">site.title</a>
</div>
```

### Grid

```
static func grid(_ nodes: Node...) -> Node {
    .div(
        .id("layout"),
        .class("pure-g"),
        .group(nodes)
    )
}
```

### Footer

```
static func footer(for site: <SiteName>) -> Node {
    let currentYear = Calendar.current.component(.year, from: Date())
    return .div(
        .class("footer pure-u-1"),
        .div(
            .class("pure-u-1"),
            .text("© \(currentYear) \(site.name)")
        ),
        .div(
            .class("pure-u-1"),
            .text("Generated using "),
            .a(
                .text("Publish"),
                .href("https://github.com/johnsundell/publish")
            ),
            .text(". Written in Swift")
        ),
        .div(
            .class("pure-u-1"),
            .a(
                .text("RSS feed"),
                .href("/feed.rss")
            )
        )
    )
}
```

### Page

```
static func page(for page: Page, on site: <SiteName>) -> Node {
    return .pageContent(
        .h2(
            .class("post-title"),
            .text(page.title)
        ),
        .div(
            .class("post-description"),
            .div(
                .contentBody(page.body)
            )
        )
    )
}
```

***NOTE***
In here you'll see `page.title` and `page.body`. These attributes come from two places. When we create a new post or page as a markdown file, we can give it `metadata` at the top of the page, the title being one of those attributes. The `page.body` will be the remaining markdown or content of your file.

Here's an example of the `metadata`: 

```
---
date: 2021-01-05 21:04 
description: A detailed guide on customizing a website with the Publish framework.
tags: development
excerpt: Customize your Publish site in a few steps to get the most out of this framework.
topic: development
title: Customizing a Publish site
---
```

### PageContent

```
static func pageContent(_ nodes: Node...) -> Node {
    return .div(
        .class("content pure-u-1 pure-u-md-3-5 pure-u-xl-6-10"),
        .group(nodes)
    )
}
```

### PageExcerpt

```
static func postExcerpt(for item: Item<SiteName>, on site: <SiteName>) -> Node {
    return .section(
        .class("post"),
        .header(
            .class("post-header"),
            .h2(
                .class("post-title"),
                .a(
                    .href(item.path),
                    .text(item.title)
                )
            ),
            .p(
                .class("post-meta"),
                .text(DateFormatter.blog.string(from: item.date)),
                tagList(for: item, on: site)
            )
        ),
        .div(
            .class("post-description"),
            .p(.text(item.metadata.excerpt))
        )
    )
}
```

***NOTE*** Back in `main.swift` we need to add a new struct called `ItemMetaData`. This will allow us to show an excerpt of our blog posts to entice the reader even more.

```
struct ItemMetadata: WebsiteItemMetadata {
    var excerpt: String
}
```

Remember above in the `metadata` example we had the attribute `excerpt`? Well, this is it. Ok moving on.

### Post

```
static func post(for item: Item<SiteName>, on site: <SiteName>) -> Node {
    return .pageContent(
        .h2(
            .class("post-title"),
            .a(
                .href(item.path),
                .text(item.title)
            )
        ),
        .p(
            .class("post-meta"),
            .text(DateFormatter.blog.string(from: item.date))
        ),
        .tagList(for: item, on: site),
        .div(
            .class("post-description"),
            .div(
                .contentBody(item.body)
            )
        )
    )
}
```

***NOTE*** To show a user-friendly date we're going to need a helper. Create a new file in `Sources/` called `DateFormatter.swift`. Feel free to change this date format to whatever pleases you. 

We'll get back to the `DateFormatter.blog.string(from: item.date)` part. Specifically the `.blog` part.

```
extension DateFormatter {
    static var blog: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}
``` 

### Posts

```
static func posts(for items: [Item<SiteName>], on site: <SiteName>, title: String) -> Node {
    return .pageContent(
        .div(
            .class("posts"),
            .h1(.class("content-subhead"), .text(title)),
            .forEach(items) { item in
                .postExcerpt(for: item, on: site)
            }
        )
    )
}
```

### Sidebar

```
private static var sections: [<SiteName>.SectionID] { [.blog, .about] }

static func sidebar(for site: <SiteName>) -> Node {
    return .div(
        .class("sidebar pure-u-1 pure-u-md-1-4"),
        .div(
            .class("header"),
            .grid(
                .div(
                    .class("pure-u-md-1-1 pure-u-3-4"),
                    .h1(
                        .a(
                            .class("brand-title"),
                            .text(site.name),
                            .href("/")
                        )

                    ),
                    .h3(
                        .class("brand-tagline"),
                        .text(site.description)
                    )
                )
            ),
            .div(
                .ul(
                    .class("pure-menu-list"),
                    .forEach(sections, { section in
                        .li(
                            .class("pure-menu-item"),
                            .a(
                                .class("pure-menu-link"),
                                .text(section.rawValue.capitalized),
                                .href(site.path(for: section))
                            )
                        )
                    })
                )
            ),
            .grid(
                .forEach(site.socialMediaLinks, { link in
                    .div(
                        .class("pure-u-4-24"),
                        .a(
                            .href(link.url),
                            .icon(link.icon)
                        )
                    )
                })
            )
        )
    )
}
```

***NOTE*** I have two notes for this one. 1. `sections` are defined in `main.swift` under `SectionID`. This allows you to create separate _pages_ such as `blog`, `about`, `podcast`, `videos`, etc. The name is a bit confusing because we're not creating "sections", but since the name `Page` is used in the Publish framework we can't use it here. 2. `socialMediaLinks` are also something we get in the framework, but we can extend it to add our own. Create a new file called `SocialMediaLink.swift` in `Sources/`. The basic structure is as follows:

```
struct SocialMediaLink {
    let title: String
    let url: String
    let icon: String
}
```

Now you can extend this and add your own. For example

```
static var github: SocialMediaLink {
    return SocialMediaLink(
        title: "GitHub",
        url: "https://github.com/mosaic6",
        icon: "fab fa-github-square"
    )
}
```

### TagList

```
static func tagList(for tags: [Tag], on site: <SiteName>) -> Node {
    return .div(.class("post-tags"), .forEach(tags) { tag in
        .a(
            .class("post-category post-category-\(tag.string.lowercased())"),
            .href(site.path(for: tag)),
            .text(tag.string)
        )
    })
}

static func tagList(for item: Item<SiteName>, on site: <SiteName>) -> Node {
    return .tagList(for: item.tags, on: site)

}

static func tagList(for page: TagListPage, on site: <SiteName>) -> Node {
    return .tagList(for: Array(page.tags), on: site)
}
```
---

## Back to HTMLFactory

This should cover all our `Nodes` for now. You can always create more or change what we have here to suit the needs of your site. 

Now that we have our nodes, let's go back in time to our `HTMLFactory` and our empty methods. 

### makeIndexHTML

```
func makeIndexHTML(for index: Index, context: PublishingContext<SiteName>) throws -> HTML {
    HTML(
        .lang(context.site.language),
        .head(for: context.site),
        .body(
            .grid(
                .sidebar(for: context.site)
            )
        )
    )
}
```

### makeBlogSectionHTML

```
func makeBlogSectionHTML(for index: Index, context: PublishingContext<SiteName>) throws -> HTML {
    HTML(
        .lang(context.site.language),
        .head(for: context.site),
        .body(
            .grid(
                .sidebar(for: context.site),
                .posts(for: context.allItems(sortedBy: \.date, order: .descending), on: context.site, title: "Posts")
            )
        )
    )
}
```

### makeSectionHTML

```
func makeSectionHTML(for section: Section<SiteName>, context: PublishingContext<SiteName>) throws -> HTML {
    if section.id == .blog {
        return try makeBlogSectionHTML(for: context.index, context: context)
    }
    return try makeIndexHTML(for: context.index, context: context)
}
```

### makeItemHTML

```
func makeItemHTML(for item: Item<SiteName>, context: PublishingContext<SiteName>) throws -> HTML {
    HTML(
        .lang(context.site.language),
        .head(for: context.site),
        .body(
            .grid(
                .sidebar(for: context.site),
                .post(for: item, on: context.site)
            )

        )
    )
}
```

### makePageHTML

```
func makePageHTML(for page: Page, context: PublishingContext<SiteName>) throws -> HTML {
    HTML(
        .lang(context.site.language),
        .head(for: context.site),
        .body(
            .grid(
                .sidebar(for: context.site),
                .page(for: page, on: context.site)
            )
        )
    )
}
```

### makeTagListHTML

```
func makeTagListHTML(for page: TagListPage, context: PublishingContext<SiteName>) throws -> HTML? {
    HTML(
        .lang(context.site.language),
        .head(for: context.site),
        .body(
            .grid(
                .sidebar(for: context.site),
                .pageContent(
                    .tagList(for: page, on: context.site)
                )
            )
        )
    )
}
```

### makeTagDetailsHTML

```
func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<SiteName>) throws -> HTML? {
    HTML(
        .lang(context.site.language),
        .head(for: context.site),
        .body(
            .grid(
                .sidebar(for: context.site),
                .posts(
                    for: context.items(
                        taggedWith: page.tag,
                        sortedBy: \.date,
                        order: .descending
                    ),
                    on: context.site,
                    title: "\(page.tag.string.capitalized) posts"
                )
            )
        )
    )
}
```

## 3. Creating our theme

It's time to put it all together. In `Sources/` create a new file called `Theme+<SiteName>.swift`. This is where we'll define our theme from the `HTMLFactory` we just created. Here is what it'll look like:

```
import Publish
import Plot

extension Theme where Site == SiteName {
    static var blog: Self {
        Theme(htmlFactory: <SiteName>HTMLFactory(), resourcePaths: ["Resources/Pure/styles.css"])
    }
}
```

You can call your theme whatever you want, I'm using `blog` since my site really is a blog 🤷‍♂️. Finally back in  `main.swift` we'll use our new theme when publishing our site.

```
try SiteName().publish(    
    withTheme: .blog,
    deployedUsing: .gitHub("<username>/<username>.github.io", useSSH: false)
)
```

# Conclusion

While the `.foundation` theme is great out of the box for getting a site up and running quickly, it does limit your styling options. With a little effort and customization you can create your own theme, and truly make a Publish site your own. I'd like to thank [John Sundell](https://www.swiftbysundell.com) for creating such a dynamic tool for Swift developers to build their websites with. Go forth and build something cool!


“I'm not dumb. I just have a command of thoroughly useless information.” 
― Bill Watterson
