//
//  File.swift
//
//
//  Created by Joshua Walsh on 1/1/21.
//

import Foundation

struct SocialMediaLink {
    let title: String
    let url: String
    let icon: String
}

extension SocialMediaLink {
    static var email: SocialMediaLink {
        return SocialMediaLink(
            title: "Email",
            url: "mailto:joshuatwalsh@gmail.com",
            icon: "fas fa-envelope-open-text"
        )
    }

    static var github: SocialMediaLink {
        return SocialMediaLink(
            title: "GitHub",
            url: "https://github.com/mosaic6",
            icon: "fab fa-github-square"
        )
    }

    static var twitter: SocialMediaLink {
        return SocialMediaLink(
            title: "Twitter",
            url: "https://twitter.com/_jtwalsh",
            icon: "fab fa-twitter-square"
        )
    }

    static var buyMeACoffee: SocialMediaLink {
        return SocialMediaLink(
            title: "Buy Me A Coffee",
            url: "https://www.buymeacoffee.com/joshuawalsh",
            icon: "fas fa-mug-hot")
    }
}
