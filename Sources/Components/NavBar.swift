//
//  SwiftUIView.swift
//  
//
//  Created by sookim on 9/25/24.
//

import Foundation
import Ignite

struct NavBar: Component {

    func body(context: PublishingContext) -> [any PageElement] {
        NavigationBar(logo: "수킴의 개인 T.W.L")
                .navigationItemAlignment(.trailing)
                .navigationBarStyle(.dark)
                .background(.steelBlue)
                .position(.fixedTop)
    }

}
