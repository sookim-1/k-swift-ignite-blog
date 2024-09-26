//
//  LanguageCategory.swift
//
//
//  Created by sookim on 9/26/24.
//

import Foundation
import Ignite

enum LanguageCategory: String, CaseIterable {
    case english = "English"
    case korean = "Korean"

    var flag: String {
        switch self {
            case .english: "🇺🇸"
            case .korean: "🇰🇷"
        }
    }

    var page: any StaticPage {
        switch self {
            case .english: HomeEn()
            case .korean: Home()
        }
    }
}
