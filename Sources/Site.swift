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
    var titleSuffix = " – My Awesome Site"
    var url = URL("https://www.example.com")
    var builtInIconsEnabled = true

    var author = "sookim-1"

    var homePage = ContentExamples()
    var theme = MyTheme()
    var tagPage = Tags()

    var layouts: [any ContentPage] {
        Story()
        CustomStory()
    }
}


