import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    func body(context: PublishingContext) -> [BlockElement] {
        Section {
            for item in context.allContent {
                ContentPreview(for: item)
                    .width(.max)
                    .margin(.bottom)
            }
        }
        .margin(.bottom, .extraLarge)
    }
}
