//
//  LuckyCardDeckImpl.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

final class LuckyCardDeckImpl: Deck {
  // MARK: - Constant
  typealias Card = LuckyCard
  
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
