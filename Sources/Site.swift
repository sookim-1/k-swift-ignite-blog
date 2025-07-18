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
    var name = githubProfileName
    var titleSuffix = " – My T.W.L Site"
    var url = URL(string: githubPagesAddress)!
    var builtInIconsEnabled = true

    var author = githubProfileName

    var homePage = Home()
    var theme = MyTheme()
    var tagPage = Tags()
    var favicon = URL(string: "/images/favicon.png")
    var feedConfiguration = FeedConfiguration(mode: .full, contentCount: 20, image: .init(url: "\(githubPagesAddress)/images/favicon.png", width: 32, height: 32))

    var pages: [any StaticPage] {
        Home()
        ContentList2024()
        ContentList2025()
        ContentListEn2024()
        ContentListEn2025()
    }

    var layouts: [any ContentPage] {
        Story()
        CustomStory()
    }
}


