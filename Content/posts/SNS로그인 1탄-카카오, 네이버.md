---
date: 2024-01-10 11:10
description: SNS Login
tags: apple, swift, ios, 카카오로그인, KakaoLogin, 네이버로그인, NaverLogin
---



안녕하세요 sookim입니다~! 👋
<br></br>
해당 포스팅은 SNS로그인에 관하여 작성해보려고 합니다.

SNS로그인은 다양한 SDK가 있는데 그 중 **카카오**, **네이버**, **페이스북**, **구글**, **깃허브** 로그인등을 구현해보고 애플의 심사지침 중 `앱 내에서 소셜로그인 서비스를 사용한다면 애플로그인을 제공해야 한다.`라는 지침이 있기 때문에 애플로그인도 함께 구현해보겠습니다.

# 카카오 로그인

카카오 로그인을 구현하기 위해서 [KakaoDeveloper](https://developers.kakao.com/) 이동하여 카카오계정 로그인을 진행합니다.

[Kakao SDK for iOS 사용방](https://developers.kakao.com/docs/latest/ko/ios/getting-started)법을 참고하여 요구사양 확인, [플랫폼등록](https://developers.kakao.com/docs/latest/ko/getting-started/app#platform), SDK 설치를 진행합니다.
<br></br>
⚠️ 위 단계 진행시 참고할 부분은 3가지 정도가 있습니다.

1. 카카오디벨로퍼스 앱 설정에서 카카오로그인을 활성화를 진행해야합니다.
   ![kakao1.png](../../Resources/images/DocsImages/kakao1.png)
2. info.plist의 앱실행허용목록 키값 추가할 때 문서 또는 코드로 작성하는 경우 LSApplicationQueriesSchemes로 키값을 명시하지만 Queried URL Schemes로 키값이 명시됩니다.
   ![kakao2.png](../../Resources/images/DocsImages/kakao2.png)
3. 카카오SDK 초기화 코드 및 커스텀 스킴에 API Key노출이 되지않도록 주의합니다.
   ![kakao3.png](../../Resources/images/DocsImages/kakao3.png)
   ![kakao4.png](../../Resources/images/DocsImages/kakao4.png)

---

위의 SDK 설정작업이 모두 완료되었다면 카카오로그인기능을 구현합니다.

💡 주요 메서드 확인

- [isKakaoTalkLoginAvailable()](<https://developers.kakao.com/sdk/reference/ios/release/KakaoSDKUser/documentation/kakaosdkuser/userapi/iskakaotalkloginavailable()/>) : 카카오톡 간편로그인 실행 가능여부
- [loginWithKakaoTalk(launchMethod:channelPublicIds:serviceTerms:nonce:completion:)](<https://developers.kakao.com/sdk/reference/ios/release/KakaoSDKUser/documentation/kakaosdkuser/userapi/loginwithkakaotalk(launchmethod:channelpublicids:serviceterms:nonce:completion:)/>) : 카카오톡 간편로그인 실행
- [loginWithKakaoAccount()](<https://developers.kakao.com/sdk/reference/ios/release/KakaoSDKUser/documentation/kakaosdkuser/userapi/loginwithkakaoaccount(prompts:loginhint:nonce:completion:)>)
   : 카카오 웹로그인 실행
  - iOS 11 이상에서 제공되는 (SF/ASWeb)AuthenticationSession 을 이용하여 로그인 페이지를 띄우고 쿠키 기반 로그인을 수행합니다. 이미 사파리에에서 로그인하여 카카오계정의 쿠키가 있다면 이를 활용하여 ID/PW 입력 없이 간편하게 로그인할 수 있습니다.

---


# 네이버 로그인

네이버 로그인을 구현하기 위해서 [NaverDevelopers](https://developers.naver.com/main/)로 이동하여 네이버계정 로그인을 진행합니다.

[네이버로그인 서비스 소개페이지](https://developers.naver.com/products/login/api/api.md)를 확인한 후 오픈 API이용 신청을 위해 애플리케이션을 등록합니다.

- [애플리케이션 등록 세부사항](https://developers.naver.com/docs/common/openapiguide/appregister.md#%EC%95%A0%ED%94%8C%EB%A6%AC%EC%BC%80%EC%9D%B4%EC%85%98-%EB%93%B1%EB%A1%9D)
- 네이버로그인은 검수를 통과해야 모든 사용자가 로그인 할 수 있고 검수를 미진행 상태인 경우에는 멤버관리 탭에서 등록한 계정으로만 로그인이 가능합니다.

[iOS용 네이버로그인 라이브러리](https://developers.naver.com/docs/login/ios/ios.md)는 Objective-C언어로 구현이 되어 있어 UIKit에서 사용하는 방법을 단계별로 설명하겠습니다.

🚨 iOS용 네이버로그인 라이브러리는 Objective-C언어로 구현이 되어 있습니다. 라이브러리 내부의 헤더파일(NaverThirdPartyConstantsForApp.h)에 관련 정보들을 작성해야 하는데 SPM에서 값을 수정할 수 없는 것 같고 SPM을 공식적으로 지원하지 않아 CocoaPod으로 설치를 진행합니다.

1. 기존의 APIKey관련 값들을 xcconfig파일로 관리하고 있어서 Pod설치를 하여 Pods~.xcconfig에 자동으 로 include하도록 post install 스크립트를 작성한 후 sdk도 함께 설치합니다.
   - SNSLogin프로젝트의 Podfile 참고
2. Build Phase에서 xcconfig파일을 참고하여 자동으로 NaverThirdPartyConstantsForApp.h의 값들을 변경하도록 합니다.
   - [SNSLogin프로젝트](https://github.com/sookim-1/iOS_ThirdParty_Projects)의 Build Phase 참고
3. info.plist의 앱실행허용목록 키값 추가 - LSApplicationQueriesSchemes
   ![naver1.png](../../Resources/images/DocsImages/naver1.png)
4. URL Schemes 설정 - 애플리케이션 등록에 설정한 값 (소문자로만 구성하도록 권장)
   ![naver2.png](../../Resources/images/DocsImages/naver2.png)
5. AppDelegate.swift에서 각종 관련 설정

```swift
   import NaverThirdPartyLogin
   
   @main
   class AppDelegate: UIResponder, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
            settingNaverSNSLogin()
            
            return true
        }
        
        func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            NaverThirdPartyLoginConnection.getSharedInstance().application(app, open: url, options: options)
            
            return true
        }
        
        func settingNaverSNSLogin() {
            // 네이버 앱 간편로그인 활성화
            NaverThirdPartyLoginConnection.getSharedInstance()?.isNaverAppOauthEnable = true
            
            // 네이버 웹 로그인 활성화
            NaverThirdPartyLoginConnection.getSharedInstance()?.isInAppOauthEnable = true
            
            // 네이버 로그인 세로모드 고정
            NaverThirdPartyLoginConnection.getSharedInstance().setOnlyPortraitSupportInIphone(true)
            
            // NaverThirdPartyConstantsForApp.h에 선언한 상수 등록
            NaverThirdPartyLoginConnection.getSharedInstance().serviceUrlScheme = SNSConfigurations.getValueFor(.naverAppURLScheme)
            NaverThirdPartyLoginConnection.getSharedInstance().consumerKey = SNSConfigurations.getValueFor(.naverConsumerKey)
            NaverThirdPartyLoginConnection.getSharedInstance().consumerSecret = SNSConfigurations.getValueFor(.naverConsumerSecret)
            NaverThirdPartyLoginConnection.getSharedInstance().appName = SNSConfigurations.getValueFor(.naverAppName)
        }
   }
```

7. (SceneDelegate가 구현되어 있다면 설정)

```swift
   class SceneDelegate: UIResponder, UIWindowSceneDelegate {
        func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
            NaverThirdPartyLoginConnection.getSharedInstance()?.receiveAccessToken(URLContexts.first?.url)
        }
   }
```

8. 로그인 동작을 원하는 곳에 NaverThirdPartyLoginConnectionDelegate를 채택한 후 requestThirdPartyLogin()메서드를 실행해줍니다.

```swift
   import NaverThirdPartyLogin
   
   class SNSLoginViewController: UIViewController {
   
        let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
   
        override func viewDidLoad() {
           super.viewDidLoad()
   
                naverLoginButton.rx.tap.bind { [weak self] in
                    guard let self
                    else { return }
                    
                    loginInstance?.delegate = self
                    loginInstance?.requestThirdPartyLogin()
                }
                .disposed(by: disposeBag)
        }
   }
   
   extension SNSLoginViewController: NaverThirdPartyLoginConnectionDelegate {
       
       // 로그인 버튼을 눌렀을 경우 열게 될 브라우저
       func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
           print("open")
       }
       
       // 로그인에 성공했을 경우 호출
       func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
           print("[Success] : Success Naver Login")
           
           self.pushToSuccessViewController(successText: "네이버로그인 성공")
       }
       
       // 접근 토큰 갱신
       func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
           print("token refresh")
       }
       
       // 로그아웃 할 경우 호출(토큰 삭제)
       func oauth20ConnectionDidFinishDeleteToken() {
           loginInstance?.requestDeleteToken()
       }
       
       // 모든 Error
       func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
           print("[Error] :", error.localizedDescription)
       }
       
   }
```

---


