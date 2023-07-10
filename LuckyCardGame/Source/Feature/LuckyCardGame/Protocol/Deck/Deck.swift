//
//  Deck.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

import Foundation

/// 카드를 저장하고 관리하는 base card Deck
///
/// Notes:
/// 1. 카드덱은 어느 카드가 올 지 몰라야 합니다. 하지만 중요한 것은 그 카드에 대한 조작을 책임져야 합니다.
/// 2. 삽입추가 등을 하기 위해 Card타입은 Comparable, Equatable을 준수하는 타입이어야 합니다.
protocol Deck: AnyObject {
  associatedtype Card: Comparable, Equatable
  associatedtype DeckError: Error
  
  var cards: [Card] { get set }
  var description: String { get }

  func insert( _ card: Card, at index: Int) throws
}

// MARK: - Helper
extension Deck {
  func shuffle() {
    _=(0..<cards.count-1).map {
      let randInt = Int.random(in: $0..<cards.count)
      if $0 != randInt { cards.swapAt($0, randInt) }
    }
  }
  
  func append(_ card: Card) {
    cards.append(card)
  }
  
  func removeLast() -> Card? {
    return cards.popLast()
  }
  
  func remove(at index: Int) -> Card? {
    guard (0..<cards.count).contains(index) else {
      return nil
    }
    return cards.remove(at: index)
  }
  
  func contain(of card: Card) -> Bool {
    return cards.contains(card)
  }
  
  func contains(of cards: [Card]) -> Bool {
    return self.cards.contains(cards)
  }
}
