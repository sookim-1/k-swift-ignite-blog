//
//  HomeEn.swift
//
//
//  Created by sookim on 9/26/24.
//

import Foundation
import Ignite

struct HomeEn: StaticPage {
    var title = "sookim's T.W.L"

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            NavBar(name: "sookim's T.W.L", language: .english)

            let orderedAllContext = context.content(ofType: "en").sorted {
                $0.date > $1.date
            }

            for item in orderedAllContext {
                ContentPreview(for: item) { content in
                    Card(imageName: content.image) {
                        Text(content.metadata["description"] as? String ?? "")
                            .horizontalAlignment(.leading)
                            .font(.title5)
                            .fontWeight(.medium)
                            .foregroundStyle(.darkEmphasis)
                            .margin(.bottom, .none)
                    } header: {
                        Text {
                            Link(content)
                                .role(.info)
                        }
                        .horizontalAlignment(.leading)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.pink)
                    } footer: {
                        let tagLinks = content.tagLinks(in: context)

                        if tagLinks.isEmpty == false {
                            Group {
                                tagLinks
                            }
                            .style("margin-top: -5px")
                        }
                    }
                }
                .width(.max)
                .margin(.vertical, 50)
                .background(.white)
            }

            SocialFooter()
            IgniteFooter()
        }
    }
}
