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
    let language: LanguageCategory

    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: logo) {
                Dropdown("Languages : \(language.flag)") {
                    for item in LanguageCategory.allCases {
                        Link(target: item.page) {
                            Text("\(item.flag) \(item.rawValue) Version")
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
