//
//  MockLuckyCardDeckImpl.swift
//  LuckyCardGameTests
//
//  Created by 양승현 on 2023/07/11.
//

@testable import LuckyCardGame

class MockLuckyCardImpl: Deck {
  // MARK: - Constant
  typealias Card = LuckyCard
  
  // MARK: - Properties
  var cards: [Card]
  var description: String {
    cards
      .map { $0.description() }
      .joined(separator: ", ")
  }
  
  // MARK: - Lifecycle
  init(cards: [Card]) {
    self.cards = cards
  }
}
