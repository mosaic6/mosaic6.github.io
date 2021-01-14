//
//  File.swift
//  
//
//  Created by Joshua Walsh on 1/11/21.
//

import Foundation
import Publish
import Plot

struct FeatureItem: WebsiteItemMetadata {
    var title: String
    var description: String
    var imagePath: Path? { nil }
}

let feature = FeatureItem(title: "Articles / Projects / Thoughts / Swift development", description: "Here is where you'll find my brain dumpings. I'll mostly be writing about my development failures and how I overcame them. Spoiler alert, I googled most of it...")


extension Node where Context == HTML.BodyContext {
    static func feature(for item: JoshuaTWalsh, feature: FeatureItem) -> Node {
        return pageContent(
            .div(
                .class("feature"),
                .h1(
                    .class("feature-header"), .text(feature.title)),
                .p(
                    .class("feature-description"), .text(feature.description))
            )
        )
    }
}
