//
//  LuckyCardDeckImpl.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

import Foundation

/// final 키워드를 붙인 이유는 LuckyCard가 들어있는 Deck이기 때문입니다. 이 클래스는 더 이상 상속을 할 수 없도록 했습니다.
/// class와 struct 중 참조 타입인 class를 선택한 이유는 struct내부 변수에 참조 타입이 있을 경우 struct가 deinit되어도 참조타입인 멤버변수는
/// 언제 할당 해제될 지 모르기 때문입니다. 예전에 MVVM 패턴에서 VM은 항상 struct로 구현했고 대부분의 객체들을 struct로 구현했습니다.
/// 하지만 혹시 struct안에 class타입의 참조 변수 인스턴스를 갖고 있을 경우 위와 같은 사항이 발생된다는 것을 알게 되면서 class 를 선택하게 된 것 같습니다.
/// 다만 조심 해야 할 부분은 참조 타입이기 때문에 strong reference cycle와 메모리 누수를 방지하기 위해 때로는 weak를 사용해야 한다는 점입니다.
final class LuckyCardDeckImpl: Deck {
  // MARK: - Constant
  typealias DeckError = LuckyCardDeckError
  typealias Card = LuckyCard
  
  // MARK: - Properties
  var cards: [Card]
  
  // MARK: - Lifecycle
  private init(cards: [Card] = []) {
    self.cards = cards
  }
  
  convenience init() {
    let manager = LuckyCardManager.shared
    self.init(cards: manager.setInitialLuckyCardDeck().shuffled())
    manager.printDeckState(self)
  }
}

// MARK: - Helpers
extension LuckyCardDeckImpl {  
  func insert(_ card: Card, at index: Int) throws {
    guard (0...cards.count).contains(index) else {
      throw DeckError.OutOfRange
    }
    cards.insert(card, at: index)
  }
  
  func removeLast() throws -> Card {
    guard let card = cards.popLast() else {
      throw DeckError.EmptyDeck
    }
    return card
  }
  
  func remove(at index: Int) throws -> Card {
    guard (0..<cards.count).contains(index) else {
      throw DeckError.OutOfRange
    }
    return cards.remove(at: index)
  }
}

// MARK: - DeckConvertible
extension LuckyCardDeckImpl: DeckConvertible {
  var description: String {
    cards.map { $0.description(with: LuckyCardManager.shared.shapeStorage) }.joined(separator: ", ")
  }
}
