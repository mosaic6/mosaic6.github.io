//
//  File.swift
//  
//
//  Created by Joshua Walsh on 1/1/21.
//

import Foundation
import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    static func post(for item: Item<JoshuaTWalsh>, on site: JoshuaTWalsh) -> Node {
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
}
