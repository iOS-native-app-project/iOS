updated date :  22.03.21

## 개발 환경

- 언어: Swift
- IDE : Xcode
- UI: Xib StoryBoard

## 사용 라이브러리
- Alamofire
- naveridlogin-sdk-ios
- KakaoSDK
- Kingfisher
- SwiftKeychainWrapper
- Firebase/Messaging
- FSCalendar

## 코딩 컨벤션
> 코드 레이아웃
> 
- 들여쓰기 및 띄어쓰기
    - 들여쓰기에는 탭(tab)을 사용합니다.
    - 콜론(:)을 쓸 때에는 콜론의 오른쪽에만 공백을 둡니다.
    - 연산자 오버로딩 함수 정의에서는 연산자와 괄호 사이에 한 칸 띄어씁니다.
- 줄바꿈
- 최대 줄 길이
    - 한 줄은 최대 99자를 넘지 않아야 합니다.
        
        ```swift
        Xcode의 **Preferences → Text Editing → Display**의 
        'Page guide at column' 옵션을 활성화하고 99자로 설정하면 편리합니다.
        ```
        
- 빈 줄
    - 모든 파일은 빈 줄로 끝나도록 합니다.
    - MARK 구문 위와 아래에는 공백이 필요합니다.
- 임포트
    - 모듈 임포트는 알파벳 순으로 정렬합니다. 내장 프레임워크를 먼저 임포트하고, 빈 줄로 구분하여 서드파티 프레임워크를 임포트합니다.
    

> 네이밍
> 
- 클래스
    - 클래스 이름에는 UpperCamelCase를 사용합니다.
    - 클래스 이름에는 약어를 사용하지 않습니다.
- 함수
    - 함수 이름에는 lowerCamelCase를 사용합니다.
    - Action 함수의 네이밍은 '주어 + 동사 + 목적어' 형태를 사용합니다.
        - Tap(눌렀다 뗌)*은 `UIControlEvents`의 `.touchUpInside`에 대응하고, *Press(누름)*는 `.touchDown`에 대응합니다.
        - *will~*은 특정 행위가 일어나기 직전이고, *did~*는 특정 행위가 일어난 직후입니다.
        - *should~*는 일반적으로 `Bool`을 반환하는 함수에 사용됩니다.
        
        **좋은 예:**
        
        ```swift
        func backButtonDidTap() {
            // ...
        }
        ```
        
        **나쁜 예:**
        
        ```swift
        func back() {
            // ...
        }
        
        func pressBack() {
            // ...
        }
        ```
        
- 변수 / 상수
    - 변수 및 상수 이름에는 lowerCamelCase를 사용합니다.
- 열거형
    - enum의 각 case에는 lowerCamelCase를 사용합니다.
    - 단 api 통신 등의 경우에는 예외가 존재할 수 있습니다.
- 약어
    - 약어로 시작하는 경우 소문자로 표기하고, 그 외의 경우에는 항상 대문자로 표기합니다.
- Delegate
    - Delegate 메서드는 프로토콜명으로 네임스페이스를 구분합니다.
    

> 클로저
> 
- 파라미터와 리턴 타입이 없는 Closure 정의시에는 () -> Void를 사용합니다.
- Closure 정의시 파라미터에는 괄호를 사용하지 않습니다.
- Closure 정의시 가능한 경우 타입 정의를 생략합니다.
- Closure 호출시 또다른 유일한 Closure를 마지막 파라미터로 받는 경우, 파라미터 이름을 생략합니다.

> 클래스와 구조체
> 
- 클래스와 구조체 내부에서는 `self`를 명시적으로 사용합니다.
- 구조체를 생성할 때에는 Swift 구조체 생성자를 사용합니다.

> 타입
> 
- Array<T>와 Dictionary<T: U> 보다는 [T], [T: U]를 사용합니다.

> 주석
> 
- `//` 를 사용해서 주석을 남깁니다.
- 함수에 대한 설명은 반드시 주석을 남깁니다.
- `// MARK:` 를 사용해서 연관된 코드를 구분짓습니다.

## 와이어프레임
- https://www.figma.com/file/D6DqnmBNuT3BgBJ8Qh7KnN/ae4-project?node-id=2%3A4

## 개발자
- 박중규, jk.park.tech@gmail.com
- 고소영, 308go@naver.com
