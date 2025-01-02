//
//  HomeEn.swift
//
//
//  Created by sookim on 9/26/24.
//

import Foundation
import Ignite

struct HomeEn2024: StaticPage {
    var title = "sookim's T.W.L"

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            NavBar(name: "sookim's T.W.L", language: .english2024)

            let orderedAllContext = context.content(ofType: "en_2024").sorted {
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
