//
//  File.swift
//  
//
//  Created by sookim on 9/26/24.
//

import Foundation
import Ignite

struct Story: ContentPage {
    func body(content: Content, context: PublishingContext) -> [any BlockElement] {
        Text(content.title)
            .font(.title1)

        if let image = content.image {
            Image(image, description: content.imageDescription)
                .resizable()
                .cornerRadius(20)
                .frame(maxHeight: 300)
                .horizontalAlignment(.center)
        }

        Text(content.body)

        if content.hasTags {
            Group {
                Text {
                    content.tagLinks(in: context)
                }
                .font(.title3)
            }
        }
    }
}
