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
                    .feature(for: context.site, feature: feature)
                )
            )
        )
    }

    func makeBlogSectionHTML(for index: Index, context: PublishingContext<JoshuaTWalsh>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .posts(for: context.allItems(sortedBy: \.date, order: .descending), on: context.site, title: "Posts")
                )
            )
        )
    }

    func makeSectionHTML(for section: Section<JoshuaTWalsh>, context: PublishingContext<JoshuaTWalsh>) throws -> HTML {
        if section.id == .blog {
            return try makeBlogSectionHTML(for: context.index, context: context)
        }
        return try makeIndexHTML(for: context.index, context: context)
    }

    func makeItemHTML(for item: Item<JoshuaTWalsh>, context: PublishingContext<JoshuaTWalsh>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: context.site),
            .body(
                .grid(
                    .header(for: context.site),
                    .sidebar(for: context.site),
                    .post(for: item, on: context.site)
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
                    .page(for: page, on: context.site)
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
                    )
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
                    )
                )
            )
        )
    }
}
