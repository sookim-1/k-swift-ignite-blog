//
//  CustomStory.swift
//  
//
//  Created by sookim on 9/26/24.
//

import Foundation
import Ignite

struct CustomStory: ContentPage {
    func body(content: Content, context: PublishingContext) -> [any BlockElement] {
        if let image = content.image {
            Image(image, description: content.imageDescription)
                .resizable()
        }

        Text(content.title)
            .font(.title1)

        if content.hasTags {
            Text {
                content.tagLinks(in: context)
            }
            .font(.title3)
        }

        Text(content.body)
    }
}
