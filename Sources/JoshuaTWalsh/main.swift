import Foundation
import Publish
import Plot
import SplashPublishPlugin
import ImageAttributesPublishPlugin

// This type acts as the configuration for your website.
struct JoshuaTWalsh: Website {
    enum SectionID: String, CaseIterable, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case blog
        case about
        case apps
    }

    struct ItemMetadata: WebsiteItemMetadata {
        var excerpt: String
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://joshuatwalsh.com")!
    var title = "Joshua Walsh"
    var name = "Joshua Walsh"
    var description = "iOS/Mac Developer"
    var language: Language { .english }
    var imagePath: Path? { nil }
    var socialMediaLinks: [SocialMediaLink] { [.email, .github, .twitter, .buyMeACoffee] }
}

try JoshuaTWalsh().publish(    
    withTheme: .blog,
    deployedUsing: .gitHub("mosaic6/mosaic6.github.io", useSSH: false),
    plugins: [.splash(withClassPrefix: ""), .imageAttributes()]
)
