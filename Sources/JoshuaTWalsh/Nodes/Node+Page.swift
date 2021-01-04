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
    static func page(for page: Page, on site: JoshuaTWalsh) -> Node {
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
}
