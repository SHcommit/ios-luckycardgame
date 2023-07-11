//
//  LuckyCardDeckImpl.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

import Foundation


final class LuckyCardDeckImpl: Deck {
  // MARK: - Constant
  typealias Card = LuckyCard
  typealias DeckError = LuckyCardDeckError
  
  // MARK: - Properties
  var cards: [Card]
  
  var description: String {
    return cards.map { $0.description() }.joined(separator: ", ")
  }
  
  // MARK: - Lifecycle
  init(cards: [Card]) {
    self.cards = cards
    self.cards.shuffle()
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
}
