import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    func body(context: PublishingContext) -> [BlockElement] {
        let orderedAllContext = context.allContent.sorted {
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
        }
    }
}

