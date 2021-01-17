//
//  File.swift
//  
//
//  Created by Joshua Walsh on 1/1/21.
//

import Plot

extension Node where Context == HTML.BodyContext {
    static func header(for site: JoshuaTWalsh) -> Node {
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
}
