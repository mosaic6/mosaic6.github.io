//
//  File.swift
//  
//
//  Created by Joshua Walsh on 1/1/21.
//

import Plot

extension Node where Context == HTML.BodyContext {
    static func sidebar(for site: JoshuaTWalsh) -> Node {
        return .div(
            .class("sidebar pure-u-1 pure-u-md-1-4"),
            .div(
                .class("header"),
                .grid(
                    .div(
                        .class("pure-u-md-1-1 pure-u-1-4"),
                        .class("author__avatar"),
                        .img(
                            .src("https://secure.gravatar.com/avatar/8f66ed083c1f256c6ba9219c674b430b")
                        )
                    ),
                    .div(
                        .class("pure-u-md-1-1 pure-u-3-4"),
                        .h1(
                            .class("brand-title"),
                            .text(site.name)
                        ),
                        .h3(
                            .class("brand-tagline"),
                            .text(site.description)
                        )
                    )
                ),
                .grid(
                    .forEach(site.socialMediaLinks, { link in
                        .div(
                            .class("pure-u-md-1-1"),
                            .a(
                                .href(link.url),
                                .icon(link.icon),
                                .a(
                                    .class("social-media"),
                                    .href(link.url),
                                    .text(link.title)
                                )
                            )
                        )
                    })
                )
            )
        )
    }
}
