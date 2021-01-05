import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.
struct JoshuaTWalsh: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        var excerpt: String
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://joshuatwalsh.com")!
    var title = "joshuatwalsh.com"
    var name = "Joshua Walsh"
    var description = "iOS/Mac Developer"
    var language: Language { .english }
    var imagePath: Path? { nil }
    var socialMediaLinks: [SocialMediaLink] { [.email, .github, .twitter, .buyMeACoffee] }
}

try JoshuaTWalsh().publish(
    withTheme: .blog,
    deployedUsing: .gitHub("mosaic6/mosaic6.github.io", useSSH: false),
    plugins: [.splash(withClassPrefix: "")]
)
