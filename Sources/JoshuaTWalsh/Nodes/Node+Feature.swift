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
    var imagePath: Path?
}

let mainFeature = FeatureItem(title: "Articles / Projects / Thoughts / Swift Development", description: "Here is where you'll find my brain dumpings. I'll mostly be writing about my development failures and how I overcame them. Spoiler alert, I googled most of it...", imagePath: "/images/calvinhobbes.jpg")

let subFeature = FeatureItem(title: "Sub", description: "feature")


extension Node where Context == HTML.BodyContext {
    static func feature(for item: JoshuaTWalsh, features: [FeatureItem]) -> Node {
        return pageContent(
            .forEach(features) { feature in
                .div(
                    .class("feature"),
                    .h1(
                        .class("feature-header"), .text(feature.title)),
                    .p(
                        .class("feature-description"), .text(feature.description))                    
                )
            }
        )
    }
}

extension Node where Context == HTMLDimensionContext {
    
}
