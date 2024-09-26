import Foundation
import Ignite

struct MyTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        HTML {
            Head(for: page, in: context)

            Body {
                NavBar()
                
                page.body

                Group {
                    SocialFooter()
                    IgniteFooter()
                }
            }
            .padding(.vertical, 80)
            .class("container")
        }
    }
}
