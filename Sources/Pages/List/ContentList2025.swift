import Foundation
import Ignite

struct ContentList2025: StaticPage {
    var title = "수킴의 개인 T.W.L"

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            NavBar(name: "수킴의 개인 T.W.L", listItemCategory: .korean2025)

            let orderedAllContext = context.content(ofType: "ko_2025").sorted {
                $0.date > $1.date
            }

            for item in orderedAllContext {
                ContentPreview(for: item)
                    .contentPreviewStyle(MyCustomContentPreviewStyle())
                    .width(.max)
                    .margin(.vertical, 50)
                    .background(.white)
            }

            SocialFooter()
            IgniteFooter()
        }
    }
}
