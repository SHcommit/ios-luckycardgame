## 📌 iOS-LuckyCardGame

# 23.07.04. (화) (4H 40m)
### [Title]: 게임보드 만들기
- [x] [Concept] OOP 학습 (1H)
- [x] [Feature] header area(노란색) with OOP (15m)
- [x] [Feature] content area, with OOP (30m)
- [x] [Feature] footer area(짙은 회색) 영역 구현 with OOP (1H)
- [x] [Feature] 앱 기본 설정(Info.plist) 개념 학습 + 기능 적용 (10m)
- [x] [Docs] 구현한 기능들 기능 문서화(30m)
- [x] 성장노트 작성 및 그룹 회고 (15m)

🚨 **과제 완성날짜 시간: 2023.07.05 | 02H:11M**
🚨 **주요 작업**

- [x] UIView을 사용할 때 frame으로 position, size 지정
- [x] LuckyCardGame main UI 구현

## 📌 [요약]

- Common을 통해 프로젝트 개발 시 편리한 기능이나 코드에서 자주 사용되는 기능들을 묶어 새로운 객체로 지정
- luckyCardGameView라는 메인 화면의 영역을 header, contentView, footer로 나눠서 구현
- UIView(frame:) 이나 frame 변수를 초기화 해서 view의 position, size 지정
- 문서화를 위한 주석 추가

## ✨ [작업 내용, 느낀점]

### [BaseView]
평소에 사용하지 않고 들어만 봤었던 BaseView를 구현해봤습니다. 자주 사용되는 프로토콜들을 미리 지정해서 필요할 때 overide해서 사용이 가능하다는 장점이 있습니다. 그러나 아쉬운 점은 기존에 protocol을 추가할 때 준수해야 할 관련 메서드들을 한번에 추가할 수 있었는데.. BaseView를 사용하면서 override해야 할 함수를 직접 찾아야 했던 불편함이 있었습니다.

### [PlayerBoardType, PlayerHeadCountType]
LuckyCardGameView를 위 Type들 키워드에 따라 재사용할 수 있도록 구현해보고 싶었습니다.



### [LuckyCardGameView]
frame은 언제 사용해야 좋을지 생각했습니다... 다양한 디바이스를 고려할 수 있는 autoLayout은 constraints를 통해 각각의 뷰 간 상대적으로 정의되지만, 결국 오토레이아웃을 사용해도 frame을 통해서 명확하게 위치가 됩니다. 그래서 가장 좋다고 생각한 경우는 둘이 혼합해서 사용했을 때라고 생각했습니다.

View의 position과 size를 구하기 쉽다고 느껴진 LyckyCardGameView영역 안의 subviews의 frame을 지정했습니다.


<img src="https://github.com/softeerbootcamp-2nd/ios-luckycardgame/assets/96910404/c4845c44-c5dd-4c89-9be2-77c8be9c5dd6"  width="200" />

이 3개의 영역은 UIView의 레이아웃을 지정할 때 auto layout을 사용했습니다. 3개 뷰의 영역에 대한 frame이 변경되고, 단 한번 contentView의 subviews의 frame을 지정했습니다. 그 경우는 아래 코드를 총해 초기화 됩니다.

https://github.com/SHcommit/ios-luckycardgame/blame/0a9934f63dd55b0d0a8a9a958f88f616b0a3bb66/LuckyCardGame/Source/Feature/LuckyCardGame/View/LuckyCardGameView.swift#L39-L44

예를들어 3개인 경우

<img src="https://github.com/softeerbootcamp-2nd/ios-luckycardgame/assets/96910404/c7f02721-61f0-4ee5-9614-5cab1af55bae"  width="400" />

<img width="250" alt="image" src="https://github.com/softeerbootcamp-2nd/ios-luckycardgame/assets/96910404/0b8f5320-ab4b-41d6-b96a-407b6e707ef1">

위와 같이 나타나집니다.

## 📸  [구현 결과]

<img src="https://github.com/softeerbootcamp-2nd/ios-luckycardgame/assets/96910404/04617f1a-aeff-430e-a206-6546533fcd84" width="350">|<img width="441" alt="image" src="https://github.com/softeerbootcamp-2nd/ios-luckycardgame/assets/96910404/53803a12-2aa8-4940-9be9-e6f1b97666b4">|
|:-:|:-:|
|`LuckyCardGameView`|`앱 이름: 럭키카드`|

# 23.07.05. (수) (5H 15m)
### [Title]: 럭키카드 클래스 구현하기
- [x] [Concept] Swift 타입 별 메모리 분석 (1H)
- [x] [Concept] 스택, 힙 프로세스 메모리 개념 학습 (1H)
- [x] [Concept] Swift 데이터 추상화 학습 (30m)
- [x] [Feature] 카드 데이터 추상화 후 재사용 가능한 클래스 구현 (1H)
- [x] [Feature] 카드 객체 랜덤 생성 후 출력하는 Provider 구현 (30m)
- [x] [Feature] 그림의 카드를 추상화 할 수 있는 data type 선언 (30m)
- [x] [Docs] 구현한 기능들 기능 문서화 (30m)
- [x] 성장노트 작성 및 그룹 회고 (15m)

🚨 **과제 완성날짜 시간: 2023.07.06 | 04H:40M**
🚨 **주요 작업**

- [x] OOP 개념 학습 (5H)
- [x] 럭키카드 클래스 구현 (11H)

## 📌 [요약]

-  raywenderlich에서 OOP개념학습 및 타입별 메모리 분석 개념 학습
- 럭키카드 클래스 세분화 데이터 모델링. model 구현 과정에서 OOP를 위해 클래스 parent, child 분리해서 생성.
-  다형성이나 일반화를 위한 제너릭 사용. (예를들어, Card함수의 경우 Shape에 대해서 제너릭을 하게 되면 좋은 점이 다양한 타입의 모양이 올 수 있다는 생각을 했기 때문에 제너릭을 사용했습니다. )
-  추상화, 테스트를 위한 pop 도입
-  Factory pattern 공부 후 cardShapeStorage에 적용

## ✨ [작업 내용, 느낀점]

### [CardShapeStorage]
여러 종류에 대해 각각의 shape를 관리할 수 있는 Storage입니다. 삭제, 업데이트, 추가가 가능합니다. 이렇게 구현한 이유는 혹시 게임에 특정 모양이 바뀌거나... 그런 기능이 있을 가능성을 대비해 만들게 되었습니다. 카드의 shape는 enum과 customstringconvertible을 통해서 유니코드값을 반환할 수 있는데 게임 진행 중일 때 새로운 모양이 추가된다면 (럭키카드 ..등)을 가정해서 삽입, 삭제도 쉽게 하기 위해 설계했습니다.

이름만 알고 있었던 Factory패턴을 그룹원들의 코드를본 후에 설명을 듣고 추가적인 공부를 통해 구현했습니다.

### [Card, LuckyCard]
카드는 shpae(Hashable) 타입을 제너릭으로 받습니다. 그 이유는 추후 카드 클래스를 상속받는 child 카드들이 단순히 luckycard가 아니라 포커 카드 등 다양한 shape가 있을 수 있다고 생각했기에 제너릭을 사용했습니다.

### [LuckyCardManager]
게임 프로젝트에서 아키텍처 패턴을 몰라.. 어느 layerd에서 카드들의 초기화를 해야하고, 분배해 주는 코드를 분리해야할지 까다로웟지만 .. LuckyCard와 LuckyCardDeck을 관리한다는 개념으로 Manager를 네이밍했습니다. 인스턴스로 갖지 않고 함수의 매개변수로 luckyCard, luckyCardDeck의 초기화를 부여하고 출력 등의 기능을 담당하도록 했습니다.


### [Deck, LuckyCardDeck]
LuckyCard를 모아두는 LuckyCardDeck을 구현했습니다.

### [View, viewController 's lifecycle']
JK님의 PR을 통해 언제 auto layout의 frame이 명확하게 superview로부터 자리잡는지의 과정을 다시 한번 생각할 수 있었습니다. 추후 시간이 남는다면 리펙터링을 할 예정입니다.

## 📸  [구현 결과]

|<img width="500" alt="image" src="https://github.com/SHcommit/ios-luckycardgame/assets/96910404/768e2c22-6112-489b-baa0-8e112fb96e6d">|
|:-:|
|` 럭키 카드 구현결과`|

# 23.07.06. (목)

## 📌 \[요약\]

### \[Title\]: 카드 나눠주기 (8H 15m)

- [x] \[Concept\] Struct와 클래스 개념 학습 (1H)
- [x] \[Concept\] ARC 개념 복습 (1H)
- [ ] \[Concept\] 메모리 분석 도구 학습 (1H)
- [x] \[Feature\] Player 기능 구현 (1H)
- [x] \[Feature\] 게임 진행하는 Manager기능 구현(1H 30m)
- [x] \[Feature\] 기존에 구현했던 노란색 영역 segment control로 대체(30m)
- [x] \[Feature\] 각 컨텐츠에 카드 뿌려주고 화면에서 카드가 겹침 등을 관리하는 Manager 구현(1H 30m)
- [ ] \[Docs\] 구현한 기능들 기능 문서화 (30m)
- [x] 성장노트 작성 및 그룹 회고 (15m)

🚨 **과제 완성날짜 시간: 2023.07.07 | 완성 시간: 12H:00m**
🚨 **주요 작업**

- [x] struct, class, enum 개념 학습 (1H)
- [x] protocol 과 enmu, genric 개념 학습 (3H)
- [x] 1일, 2일차 PR 피드백에 대한 전반적인 리펙터링 (10H)
- [x] player의 카드가 놓일 layout에 대한 frame 길이 설계 (1H)

## 📌 \[요약\]

- UISpacing 세분화
- baseView 공통적으로 view 타입에 따라 기본 색 지정 + radius 지정
- 카드 모양과 숫자 generic타입으로 구현해서 다양한 enum을 받을 수 있도록. + 다른 개발자도 알기 쉽게 enum 전용 프로토콜 선언
- 팩터리 패턴 도입의 모호성으로 제거
- 예기치 못한 상황에 대해 전부 에러타입으로 할 생각이었는데.. 옵셔널 타입을 이용하면 do-try-catch 이나 rethrows안해도 되는 장점. throw-> 옵셔널 타입으로 변경
- LuckyCardManager 싱글톤 제거
- header, contentView, footer 오토 레이아웃 -> frame으로 layout 지정. ( LayoutSubviews()에서 초기화 해야 하는 문제 해결 )

## ✨ [느낀점]

### validation 등에 대해서 오류가 났을 때 등 예기치 못한 상황이 발생할 가능성이 있다면 거의 에러 타입을 만들고 던져서 handling 했습니다. PR에서 JK님의 코드 리뷰를 통해 '옵셔널'타입을 사용해도 좋다는 것을 깨닫게 되었습니다.

### Card를 상속받아 다양한 타입의 카드 ex) LuckyCard, PockerCard, BicycleCard를 받는다고 가정했을 때 이들의 모양과 숫자가 전부 다르다는 것을 가정했고 모양과 숫자가 enum타입이나 struct타입일 때 어떻게 이런 카드타입을 허용하는 base class인 Card 객체를 생성할 수 있을까 고민했고..키가 될 수 있는 타입인 Hashable을 적용한 특정 protcol을 채택하도록 제너릭 타입을 적용했습니다.

## 📸 \[개선된 점\]

- layoutSubviews()에서 초기화 x
<img width="400" alt="image" src="https://github.com/SHcommit/ios-luckycardgame/assets/96910404/5fd456fc-7ebb-49fc-b365-9bb66a982621">

사실 제 코드의 가장 큰 문제는 auto layout으로 header, contentView, footer를 정한 후 bounds가 지정될 때 contentView안 subviews를 contentView.bounds를 통해 지정하는 것이었습니다. 하지만 header, contentView, footer와 LuckyCardGameView 또한 frame으로 지정해주면서 문제를 해결했습니다. header, contentView, footer의 containerView인 LuckyCardGameView는 viewDidLoad시점에 statusBar 높이와 safeAreaLaoutGuide Bottom height를 구함으로써 모든 문제가 해결되었습니다.

- 오토레이아웃 -> frame으로 코드 길이 간소화.
### 오토레이아웃으로 코드 지정했을 때 Constraints
<img src="https://github.com/SHcommit/ios-luckycardgame/assets/96910404/dacb4189-bf04-4bf7-a8f9-ca8b87e948a1" width="350" >

<img width="729" alt="리펙터-제약2" src="https://github.com/SHcommit/ios-luckycardgame/assets/96910404/50e54423-a333-41fa-b576-d6a7ceb33f34">
### frame을 지정했을 때

<img width="819" alt="스크린샷 2023-07-07 오전 10 59 32" src="https://github.com/SHcommit/ios-luckycardgame/assets/96910404/c472885e-c7a1-4ce8-a879-5a3cd5747e62">

# 23.07.07. (금, 토, 일)

### \[Title\]: 게임 카드 나눠주기

## 📌 \[요약\]

- 이전 PR 코드리뷰에 대한 리펙터링, 코드 보완을 중심으로 했습니다.
- Frame만 사용해서 디바이스의 화면 별로 **비율**을 통해 layout 잡히도록 구현했습니다.
- 플레이어 수 3명, 4명, 5명일 별로 각기 다른 룰 적용 가능하도록 LuckyCardManager를 class타입으로 구현해 참조를 이루었습니다.
- 카드 나눠주기 완료
- 플레이어 추가
---

## 📸 \[구현 기능\]

![ezgif com-video-to-gif](https://github.com/SHcommit/ios-luckycardgame/assets/96910404/6f0fc4aa-c96d-48af-9092-9d8bcb99b3d7)

오토레이아웃 사용하지 않고 **프레임**으로 디바이스의 bounds에 따라 상대적인 width, height를 구해가며 작업했습니다. 살짝 예상은 했지만 디바이스 별로 카드 길이가 늘어나고 줄어드는 것이 마치 오토 레이아웃처럼.. 됩니다.

처음부터 화면들을 접근할 때 사실 오토레이아웃이나 프레임이나 똑같이 spacing만큼 상대적으로 "디바이스를 기준으로 처리해주면 되는거 아닌가?" 생각 했는데 주말 내내 할 줄 몰랐습니다...

디바이스 화면 UI 작업할 때 iOS 14 pro로 초기 화면 비율을 지정된 높이 노란색영역(44..네비바..) 에 맞춰서 회색 영역의 크기를 노란색에 대한 상대적인 비율로 높이를 잡았었는데, 작은 화면에서 잡았으면 작은 화면에서도 잘 동작 될지 궁금증합니다.


이번에 확실하게 안 개념은 bounds입니다. 이것은 마치 오토레이아웃처럼 spacing을 주면 동작되는게 신기했습니다. 개발자 소들이의 frame vs bounds를 예전에 공부하며 봤을때는 잘 이해가 안갔는데 오늘에서야 이해를 한 것 같습니다. frame vs bounds...

피드백을 통해서 보완하고 리펙터링하면서 목, 금 피드백과 PR 코드 리뷰를 보며 부족하지만 조금은OOP에 대해서 알게 되었습니다.

1주차 미션 할 때  상속 단계 3단계?까지 있는 자식 객체도 구현하면서 "클래스를 왜쓰지?" 하면서 주말에서야 확실히 블로그에 개념을 정리하며 기본 개념을 많이 까먹었다는 것을 알게 되었습니다.


<img width="500" alt="스크린샷 2023-07-07 오전 10 59 32" src="https://github.com/SHcommit/ios-luckycardgame/assets/96910404/dc4e6768-99fe-467a-be95-bfe9b73da277">

세그먼트 바가 네비게이션 바 높이와 딱 알맞게 44인걸 초반에 전혀 알지 못했습니다. 미션 처음 봤을 때 "상태바 아래부터 top spacing 0으로 해서 44만큼의 길이를 세그먼트 바로 지정하면 되겠다"는 생각을 했습니다. 추후에 세그먼트 바가 동작을 안해서 3시간정도 고민하다가 자식뷰에서 터치가 동작되려면 상위뷰에서 isUserInteractive를 허용했지만 결국 뷰 계층 구조를 통해 네비게이션 바가 있음을 알게 되었습니다.


위 사진은 제 뷰 구성입니다. 여기서 궁금한 점은 화면 단위를 영역으로 나눠서 영역 안에 또 다른 영역을 나눠서 화면 구현을 진행했습니다. 이렇게 하는 경우의 장 단점이 궁금합니다..


이전에 자신이 짠 코드를 구성하는 시간에 struct 와 클래스에 대한 대화가 오갔고 그 대화 속에서 특정 예시를 통해 클래스의 참조를 다시 이해하게 되었습니다. 그렇게 LuckyCardManager를 참조로 적극 활용했습니다.

# 23.07.11. (화)

### \[Title\]: 게임 카드 나눠주기 + unit test를 위한 의존성 역전으로 연관성 있는 의존성들 전부 의존성 분리 리펙터링

## 📌 \[요약\]

- testable한 코드를 만들고자 전부 리펙터링했습니다.
- 기존 CardShapeStroage라는 카드 모양을 저장하거나 추가할 수 있는 model은 결국 enum 의 case가 추가되야해서 제거했습니다.
- model간 protocol을 통해 의존성을 최소화 했습니다.
- Card에 올 수 있는 모양, 숫자 제너릭 타입 enum 한정으로 제약했습니다.
- 카드 나눠줄 때 간단한 애니메이션을 도입했습니다.

---

## 📸 \[구현 기능\]

<img width="500" alt="image" src="https://github.com/SHcommit/ios-luckycardgame/assets/96910404/6a767939-7332-4a94-ba5d-8cebc2271998">

카드 모양의 경우 다양한 enum 타입만 올 수 있도록 RawRepresentable을 채택했습니다.

<img width="500" alt="image" src="https://github.com/SHcommit/ios-luckycardgame/assets/96910404/88ea24ce-4759-4cf5-b05e-b6639b1fc265">

카드 숫자의 경우 다양한 enum타입만 올 수있도록 했고 추가적으로 카드간 숫자를 비교하기 위해 Equatable, Comparable을 채택했습니다.

<img width="500" alt="image" src="https://github.com/SHcommit/ios-luckycardgame/assets/96910404/ac4a13ee-a2e9-48bd-a10b-5d4ed5439ea4">

카드는 enum 타입의 shape, enum타입의 shape만 제너릭 타입으로 올 수 있습니다. 컴파일 단계 오류를 방지하기 위함입니다.

<img width="500" alt="image" src="https://github.com/SHcommit/ios-luckycardgame/assets/96910404/0ece5427-c1f7-4ce0-8243-dcbf96d052f0">

LuckyCard는 Card의 자식 객체로 description을 오버라이드해서 자신의 현재 카드 상태를 문자열로 반환합니다.

의존성 분리에 힘썼고 클린 코드를 위해 길이가 긴 함수는 네이밍으로 쉽게 파악하고자 함수를 선언해서 분리했습니다.

중복되는 코드를 제거하기 위해 리펙터링했습니다.

각 객체가 맡아야할 역할을 정했고 의존성 역전 원칙에 의한 DI를 통해 mock객체로 추후  test를 위해 protocol로 기능 관련 함수를 정의 했습니다.

카드가 처음 세팅될 때 애니메이션을 넣었습니다.

<img width="847" alt="image" src="https://github.com/SHcommit/ios-luckycardgame/assets/96910404/04946022-6863-4c9d-af9b-50ae435c0090">

---

# 23.07.14. (금)

### \[Title\]: (1-4) 게임 로직 구현하기. (2-1) 게임 로직 구현하기(이어서), (2-2) 게임규칙 추가하기 일부 UI구현

## 📌 \[요약\]

- 클린 코드를 떠올리며 리펙터링을 진행(캡슐화, 코드 길이 분리)
- 유닛 테스트하기 위해 객체에서 의존성 있는 부분을 의존성 역전 원칙(DIP)에 의한 DI 하기 위한 리펙터링
- 다른 분들 PR과 제 PR의 코드 리뷰를 바탕으로 코드 리펙터링
- LuckyGame 추가 ( 기존 LuckyCardGameManager 리펙터링. VM에서 관리하던 player model 또한 LuckyGame으로 이전 후 코드 간소화)
- protocol을 통해 추상화
- 카트 터치시 뒷장 보여주는 애니메이션 도입 ( 로직과 아직 미연동 )

---

## ✨ [학습 키워드]
- Unit Test
- Test Double
- Dependency Injection + Dependency Inversion Principle
- SOLID
- OOP
- Protocol
- 클래스 내 state(속성, 프로퍼티..)의 책임은 메서드한테 있고 private(set)도 좋지만 디미터법칙 지키자.
- Git command

## 📸 \[구현 기능 + 느낀점\]

### [Unit Test]

![스크린샷 2023-07-23 오후 1 32 13](https://github.com/SHcommit/ios-luckycardgame/assets/96910404/9d255a6c-b61d-40da-bac6-e454d6da76bc)

다른 개발자가 봤을 때, SUT(SystemUnderTest) 중인 객체의 핵심 로직을 쉽게 알고, 클래스가 어느 역할을 할 수 있는지 알기 위해 테스트를 진행했습니다.


 ```
func testSUT_어느행동을취했을때_예상되는결과값() { ... }
```

함수를 봤을 때 어떤 테스트를진행중이며 어느 결과를 예상할 수 있는지 파악하기 쉽도록 작성했습니다. Mock, Stub을 위한 protocol을 선언했는데, var 타입에서 protocol타입을 get set 으로 선언 했지만 Mock 클래스를 구현할 때 특정 protocol은 구현하기 까다로웠습니다. associatedType등을 더 잘 작성해야하고 var 타입은 선언 할 때는 많은 고민 후에 선언해야 좋겠다는 생각이 들었습니다..

직접 알고리즘을 적용한게 아닌 foundation에서 제공하는 함수를 사용했음에도 테스트 케이스가 틀린 경험을 했습니다... 그리고 완벽한 줄 알았던 contains(of:) 함수가 잘못됬단느것을 알게되었습니다. 기존에 개발을 한다면? Model에 관련된 기능 설계 중간에 print, debug를 반복했을 것인데 그리고 실제로 UI component구현 후 이전에 구현했던 로직과 연동 후 예상치 못한 오류를 찾았습니다. 이 방식보다 ? 차라리 미리 내가 구현하는 기능 test코드로 남겨두면 추후에 변경될 수 있지만, 그럼에도 test 코드 작성에 약간호감이 생겼습니다.

### [DIP + DI]
1주차 때 고민은 "내가 왜 vm을 만드는데 protocol을 선언하지? 파일이랑 코드만 늘어나고 쓰지도 않고.. view안에 인스턴스로 선언할 때도 protocol로 하지 않는데"의 생각은 계속 됬고 유닛 테스트를 위한? testable한 코드는 무엇인지에 대한 고민을 하다 DIP + DI에 대한 공부를 더 자세하게 하게 되었습니다.(TDD로 해야하는데 반대가 됬지만,,) 의존성이 있는 두 객체의 의존성을 느슨하게!! 꼭 필요하다는 생각이 들었습니다.

 이를 적용하기 위해 리펙터링을 진행했습니다. 몇 개는 DIP + DI 성공했고 몇개는 성공하지 못했습니다. 프로토콜을 사용하는 쪽에서 type이 잘 안맞았고.. 초기에 protocol로 정의한 함수, associatedType등이 아니었기에 관련된 객체가 의존되어있어서 단 기간 내 리펙터링 할 수 없었습니다... 다음 부터 코드를 짠다면 protocol에서 일반화 할 수 있는 타입들을 잘 설계해서 associatedType등으로 선언 후 타입 지정도 잘 활용해야 겠다는 다짐이 들엇습니다.

### [SOLID]
PR의 코드 리뷰를 통해 테스트를 작성하며, 다른 개발자들이 봤을 때 이 sut의 객체는 어느 기능을 갖고 있는지 충분히 이해할 수 있어야 한다는 생각이 들었습니다. 그래서 sut는 어느 기능을 나타내는지 역할을 명확하게 설계해야 겠다는 생각이 들었습니다. 

### [Github rebase, cherry-pick, reset, revert]
이전에는 .. 깃허브도 협업으로 좀 다뤘기에 실무에서도 충분히 github을 다룰 수 있을 것이라 생각했는데 전혀 아니였습니다. OTL.. 이번주에 2일 정도는 PR올릴 때 초기 입력한 커밋이 올라가지 않도록 수정하기위해 힘썼고 .. 50개정도의 커밋에 대한 rebase 수정하면서 .pbxproj 컨플릭트에 대해 친근감이 생겼습니다. Git command 부족한 키워드에 대해서 알게 됬고 시간이 남을 때 공부를 틈틈히 하려고 합니다. 승민님이 도와주지 않았다면 지금도 계속해서 초기 커밋이 올라갈 것이라는 생각이 들었습니다.

### [Flip animation]

![무야호](https://github.com/SHcommit/ios-luckycardgame/assets/96910404/68c7ce89-4269-4752-aee5-ee9851807097)


## ✨ \[느낀점\]
리펙터링과 개념 공부하는데 시간을 너무 들여.. 미션을 모두 완수하지 못한 아쉬움이 있습니다. 그럼에도 어렴풋하게 알고 있었던 제너릭과 protocol의 활용에 대해서 코드와 에러, 리펙터링으로 부딪치며 좀 더 공부한 것 같고, 이 과정에서 특정 protocol의 함수를 선택적으로 준수해서 구현하는 방법, var {  get } 타입의 private(set) var를 통해 읽기모드로 but 쓰기 불가. 제너릭과 protocol의 활용, Unit Test.., enum 활용 등 많은 개념을 익혔고, 부족한 개념들도 알 수 있어 좋았습니다 +_+
