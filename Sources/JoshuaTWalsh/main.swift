import Foundation
import Publish
import Plot
import SplashPublishPlugin
import ImageAttributesPublishPlugin

struct JoshuaTWalsh: Website {
    enum SectionID: String, CaseIterable, WebsiteSectionID {
        case blog
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        var excerpt: String
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://joshuatwalsh.com")!
    var title = "Joshua Walsh"
    var name = "Joshua Walsh"
    var description = "iOS Developer"
    var language: Language { .english }
    var imagePath: Path? { nil }
    var socialMediaLinks: [SocialMediaLink] { [.email, .github, .twitter, .buyMeACoffee] }
}

//try JoshuaTWalsh().publish(at:  nil, using: [
//    .addMarkdownFiles(),
//    .copyResources(),
//    .generateHTML(withTheme: .foundation),
//    .generateSiteMap(),
//    .deploy(using: .gitHub("mosaic6/mosaic6.github.io")),
//    .installPlugin(.splash(withClassPrefix: ""))
//])
try JoshuaTWalsh().publish(
    withTheme: .blog,
    deployedUsing: .gitHub("mosaic6/mosaic6.github.io", useSSH: false),
    plugins: [.splash(withClassPrefix: ""), .imageAttributes()]
)
