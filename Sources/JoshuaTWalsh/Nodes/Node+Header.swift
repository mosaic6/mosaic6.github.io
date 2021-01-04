//
//  File.swift
//  
//
//  Created by Joshua Walsh on 1/1/21.
//

import Plot

extension Node where Context == HTML.BodyContext {
    private static var sections: [JoshuaTWalsh.SectionID] { [JoshuaTWalsh.SectionID.about] }

    static func header(for site: JoshuaTWalsh) -> Node {
        return .div(
            .div(
                .class("pure-menu pure-menu-horizontal pure-u-1-1 top-header"),
                .a(
                    .class("pure-menu-heading"),
                    .text(site.title),
                    .href("/")
                ),
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
            )
        )
    }
}
