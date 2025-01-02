import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        let site = SookimSite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct SookimSite: Site {
    var name = "sookim-1"
    var titleSuffix = " – My T.W.L Site"
    var url = URL(string: "https://sookim-1.github.io")!
    var builtInIconsEnabled = true

    var author = "sookim-1"

    var homePage = Home2025()
    var theme = MyTheme()
    var tagPage = Tags()
    var favicon = URL(string: "/images/favicon.png")
    var feedConfiguration = FeedConfiguration(mode: .full, contentCount: 20, image: .init(url: "https://sookim-1.github.io/images/favicon.png", width: 32, height: 32))

    var pages: [any StaticPage] {
        Home2024()
        Home2025()
        HomeEn2024()
        HomeEn2025()
    }

    var layouts: [any ContentPage] {
        Story()
        CustomStory()
    }
}


