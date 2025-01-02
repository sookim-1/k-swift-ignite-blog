//
//  NavigationListCategory.swift
//
//
//  Created by sookim on 9/26/24.
//

import Foundation
import Ignite

enum NavigationListCategory: String, CaseIterable {
    case korean2025 = "Korean2025"
    case english2025 = "English2025"
    case korean2024 = "Korean2024"
    case english2024 = "English2024"

    var flag: String {
        switch self {
        case .korean2025: "🇰🇷 2️⃣0️⃣2️⃣5️⃣"
        case .english2025: "🇺🇸 2️⃣0️⃣2️⃣5️⃣"
        case .korean2024: "🇰🇷 2️⃣0️⃣2️⃣4️⃣"
        case .english2024: "🇺🇸 2️⃣0️⃣2️⃣4️⃣"
        }
    }

    var page: any StaticPage {
        switch self {
        case .korean2025: ContentList2025()
        case .english2025: ContentListEn2025()
        case .korean2024: ContentList2024()
        case .english2024: ContentListEn2024()
        }
    }
}
