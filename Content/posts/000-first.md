---
date: 2023-12-02 09:00
description: Tuist
tags: notice
---
Tuist는 XcodeGen과 더불어 Xcode 프로젝트 파일의 생성및 관리할 수 있는 도구(Command Line Tool) 입니다. 

XcodeGen은 프로젝트 설정을 yml이나 json으로 관리 하는 반면에 Tuist는 Project.swift라는 파일로 관리할 수 있습니다. Project.swift는 스위프트언어로 작성되어 있습니다.

[Raywenderlich - Tuist 정리](https://www.notion.so/Raywenderlich-Tuist-81f2114bd8724524a22e8367c23dfdba?pvs=21)

# 사용하기

1. Tuist 툴을 설치합니다.
    - `tuistenv` 라고 생성되어도 추후 `tuist` 로 변경 예정이라고 합니다.
    
    ```swift
    $ curl -Ls https://install.tuist.io | bash
    ```
    

1. 빈 디렉토리를 생성한 후 해당경로로 이동하여 프로젝트 생성합니다.
    - 프로젝트를 생성하는데 이전의 SPM을 사용한적이 있다면 `Package.swift` 와 `Project.swift` 는동일합니다.
    
    ```swift
    # UIKit
    $ tuist init --platform ios
    
    # SwiftUI
    $ tuist init --platform ios --template swiftui
    ```
    

1. tree 명령어로 파일 구조 확인 가능합니다.
    
    ```swift
    # tree 설치
    $ brew install tree
    
    $ tree .
    ```
    
2. `Project.swift` 수정하는 방법
    
    ```swift
    $ tuist edit
    ```
    
3. 위에서 작성한 Project.swift파일을 기반으로 xcodeproj와 xcworkspace를 생성합니다.
    
    ```swift
    # 기본적으로 의존하는 프로젝트를 모두 생성합니다
    $ tuist generate
    
    # workspace의 특정 프로젝트만 생성하고 싶은 경우 옵션을 사용합니다.
    $ tuist generate --project-only
    ```
    
4. 외부 Dependency 가져오기 (외부라이브러리)
    
    ```swift
    $ tuist fetch
    ```
    

# 참고링크

- Tuist 공식 사이트 - https://tuist.io/
- Tuist 사용방법 (김종권님의 블로그) - https://ios-development.tistory.com/m/1006
- Tuist 튜토리얼 (Raywenderlich) - https://www.raywenderlich.com/24508362-tuist-tutorial-for-xcode
- Tusit 도입기 (Yogiyo) - [https://techblog.yogiyo.co.kr/ios-프로젝트에-tuist-적용기-1d8f7d489252](https://techblog.yogiyo.co.kr/ios-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%97%90-tuist-%EC%A0%81%EC%9A%A9%EA%B8%B0-1d8f7d489252)
