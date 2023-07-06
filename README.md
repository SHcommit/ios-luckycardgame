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

### [Title]: 카드 나눠주기 (8H 15m)
- [ ] [Concept] Struct와 클래스 개념 학습 (1H) 
- [ ] [Concept] ARC 개념 복습 (1H)
- [ ] [Concept] 메모리 분석 도구 학습 (1H)
- [ ] [Feature] Player 기능 구현 (1H)
- [ ] [Feature] 게임 진행하는 Manager기능 구현(1H 30m)
- [ ] [Feature] 기존에 구현했던 노란색 영역 segment control로 대체(30m)
- [ ] [Feature] 각 컨텐츠에 카드 뿌려주고 화면에서 카드가 겹침 등을 관리하는 Manager 구현(1H 30m)
- [ ] [Docs] 구현한 기능들 기능 문서화 (30m)
- [ ] 성장노트 작성 및 그룹 회고 (15m)

# 23.07.07. (금) 
### [Title]: 게임 로직 구현하기 (6H 45m)
- [ ] [Feature] XCTest, Unit test 개념 학습 (1H)
- [ ] [Feature] 이전에 구현했던 세부 기능들을 사용해 게임 로직 구현 (2H)
- [ ] [Feature] 참가자와 화면 전체를 포함하는 LuckyGame 구현 (1H)
- [ ] [Feature] 요구사항에 맞는 정렬 기능들 구현 (1H)
- [ ] [Feature] 특정 참가자와 해당 참가자 카드 중에 가장 낮은 숫자 또는 가장 높은 숫자, 바닥 카드 중 아무거나를 선택해서 3개가 같은지 판단 할 수 있는 기능 구현 (1H)
- [ ] [Docs] 구현한 기능들 기능 문서화 (30m)
- [ ] 성장노트 작성 및 그룹 회고 (15m)

