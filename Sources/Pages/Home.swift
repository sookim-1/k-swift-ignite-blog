//
//  Home.swift
//  SookimTWL
//
//  Created by sookim on 1/2/25.
//

import Foundation
import Ignite

struct Home: StaticPage {
    var title = "수킴의 개인 T.W.L"

    func body(context: PublishingContext) -> [BlockElement] {
        Group {
            Text("개발의 여정을 기록하는 공간")
                .font(.title1)

            Text("A Space to Document My Development Journey")
                .font(.title1)
        }

        Group {
            Text {
                "이 웹사이트는 iOS 개발자로서 매주 학습하고 경험한 내용을 기록하기 위한 공간입니다. 개인적으로 지난 한 주 동안 무엇을 배우고 잊지 않기 위한 용도로 사용 중입니다."
            }
            .font(.lead)

            Text {
                "This website is a place where I, as an iOS developer, record what I learn and experience each week. It’s a personal tool to help me remember what I’ve learned over the past week."
            }
            .font(.lead)
        }

        Group {
            Text {
                "연도별 목록"
            }
            .font(.title2)

            Text {
                "Year List"
            }
            .font(.title2)
        }

        Text("한국어")
            .font(.title6)

        List {
            Text {
                Link("🇰🇷 2️⃣0️⃣2️⃣5️⃣ 목록", target: ContentList2025())
                    .linkStyle(.button)
                    .role(.primary)
            }

            Text {
                Link("🇰🇷 2️⃣0️⃣2️⃣4️⃣ 목록", target: ContentList2024())
                    .linkStyle(.button)
                    .role(.primary)
            }
        }
        .listStyle(.unordered(.default))

        Text("English")
            .font(.title6)

        List {
            Text {
                Link("🇺🇸 2️⃣0️⃣2️⃣5️⃣ Lists", target: ContentListEn2025())
                    .linkStyle(.button)
                    .role(.primary)
            }

            Text {
                Link("🇺🇸 2️⃣0️⃣2️⃣4️⃣ Lists", target: ContentListEn2024())
                    .linkStyle(.button)
                    .role(.primary)
            }
        }
        .listStyle(.unordered(.default))

    }
}
