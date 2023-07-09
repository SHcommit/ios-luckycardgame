//
//  Deck.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

import Foundation

protocol Deck: AnyObject {
  associatedtype Card
  associatedtype DeckError: Error
  
  var cards: [Card] { get set }

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
}
