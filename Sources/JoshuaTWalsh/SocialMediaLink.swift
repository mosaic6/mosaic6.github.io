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
    // TODO: Change location
//    static var location: SocialMediaLink {
//        return SocialMediaLink(
//            title: "Vilnius, Lithuania",
//            url: "https://en.wikipedia.org/wiki/Vilnius",
//            icon: "fas fa-map-marker-alt"
//        )
//    }

    // TODO: Change linkedIn
//    static var linkedIn: SocialMediaLink {
//        return SocialMediaLink(
//            title: "LinkedIn",
//            url: "https://www.linkedin.com/in/povilas-staškus-6b10528b",
//            icon: "fab fa-linkedin"
//        )
//    }

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
}
