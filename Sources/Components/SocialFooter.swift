//
//  File.swift
//  
//
//  Created by sookim on 9/25/24.
//

import Foundation
import Ignite

public struct SocialFooter: Component {
    let icons = [
        Image(systemName: "github"),
        Image(systemName: "linkedin"),
        Image(systemName: "medium")
    ]

    let urlStrings = [
        githubAddress,
        linkedInAddress,
        blogAddress
    ]

    public func body(context: PublishingContext) -> [any PageElement] {
        Text {
            for (icon, urlString) in zip(icons, urlStrings) {
                Link(icon, target: urlString)
                    .margin(.trailing, 20)
                    .role(.secondary)
                    .target(.blank)
                    .relationship(.noOpener, .noReferrer)
            }
        }
        .font(.title2)
        .horizontalAlignment(.center)
        .margin(.top, .extraLarge)
    }
}
