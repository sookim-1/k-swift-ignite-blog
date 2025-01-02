//
//  NavigationListCategory.swift
//
//
//  Created by sookim on 9/26/24.
//

import Foundation
import Ignite

enum NavigationListCategory: String, CaseIterable {
    case english2024 = "English2024"
    case korean2024 = "Korean2024"
    case english2025 = "English2025"
    case korean2025 = "Korean2025"

    var flag: String {
        switch self {
        case .english2024: "🇺🇸 2️⃣0️⃣2️⃣4️⃣"
        case .korean2024: "🇰🇷 2️⃣0️⃣2️⃣4️⃣"
        case .english2025: "🇺🇸 2️⃣0️⃣2️⃣5️⃣"
        case .korean2025: "🇰🇷 2️⃣0️⃣2️⃣5️⃣"
        }
    }

    var page: any StaticPage {
        switch self {
        case .english2024: HomeEn2024()
        case .korean2024: Home2024()
        case .english2025: HomeEn2025()
        case .korean2025: Home2025()
        }
    }
}
