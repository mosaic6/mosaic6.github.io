//
//  File.swift
//  
//
//  Created by Joshua Walsh on 1/1/21.
//

import Plot

extension Node where Context == HTML.BodyContext {

    private static var sections: [JoshuaTWalsh.SectionID] { [.blog, .about] }

    static func sidebar(for site: JoshuaTWalsh) -> Node {
        return .div(
            .class("custom-sidebar sidebar pure-u-1 pure-u-md-1-4"),
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
                        .class("menu-list"),
                        .forEach(sections, { section in
                            .li(
                                .class("menu-list-item"),
                                .a(
                                    .class("menu-list-link"),
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
                                .class("menu-list-link-icon"),
                                .href(link.url),
                                .icon(link.icon)
                            )
                        )
                    })
                )
            )
        )
    }
}
