//
//  File.swift
//  
//
//  Created by Joshua Walsh on 1/4/21.
//

import Publish
import Plot

struct JTWHTMLFactory: HTMLFactory {

    func makeIndexHTML(for index: Index, context: PublishingContext<JoshuaTWalsh>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .posts(
                        for: context.allItems(
                            sortedBy: \.date,
                            order: .descending
                        ),
                        on: context.site,
                        title: "Recent posts"
                    ),
                    .footer(for: context.site)
                )
            )
        )
    }

    func makeSectionHTML(for section: Section<JoshuaTWalsh>, context: PublishingContext<JoshuaTWalsh>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .pageContent(.h1(.text(section.title))),
                    .footer(for: context.site)
                )
            )
        )
    }

    func makeItemHTML(for item: Item<JoshuaTWalsh>, context: PublishingContext<JoshuaTWalsh>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .post(for: item, on: context.site),
                    .footer(for: context.site)
                )

            )
        )
    }

    func makePageHTML(for page: Page, context: PublishingContext<JoshuaTWalsh>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .page(for: page, on: context.site),
                    .footer(for: context.site)
                )
            )
        )
    }

    func makeTagListHTML(for page: TagListPage, context: PublishingContext<JoshuaTWalsh>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .pageContent(
                        .tagList(for: page, on: context.site)
                    ),
                    .footer(for: context.site)
                )
            )
        )
    }

    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<JoshuaTWalsh>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .posts(
                        for: context.items(
                            taggedWith: page.tag,
                            sortedBy: \.date,
                            order: .descending
                        ),
                        on: context.site,
                        title: "\(page.tag.string.capitalized) posts"
                    ),
                    .footer(for: context.site)
                )
            )
        )
    }
}
