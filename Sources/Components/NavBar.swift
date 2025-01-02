//
//  SwiftUIView.swift
//  
//
//  Created by sookim on 9/25/24.
//

import Foundation
import Ignite

struct NavBar: Component {
    let name: String
    let language: NavigationListCategory

    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: logo) {
                Dropdown("List : \(language.flag)") {
                    for item in NavigationListCategory.allCases {
                        Link(target: item.page) {
                            Text("\(item.flag)")
                                .margin(.none)
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .navigationItemAlignment(.trailing)
            .navigationBarStyle(.dark)
            .background(.steelBlue)
            .position(.fixedTop)
    }

    private var logo: any InlineElement {
        Text(name)
            .fontWeight(.bold)
            .margin(.none)
            .font(.title4)
            .foregroundStyle(.white)
    }

}
