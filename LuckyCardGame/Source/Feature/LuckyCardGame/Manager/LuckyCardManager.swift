//
//  LuckyCardManager.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

import Foundation

final class LuckyCardManager {
  // MARK: - Constant
  struct Constant {
    enum Card {
      static let NumberOfCards = 36
      static let NumberOfSpecificShapeCards = 12
      static let shapes: [LuckyCardShapeType: String] = [
        .cat: "U+1F431", .cow: "U+1F42E", .dog: "U+1F436"]
    }
  }
  
  // MARK: - Properties
  let shapeStorage: LuckyCardShapeStorageImpl = .init(shapes: Constant.Card.shapes)
}

// MARK: - CardManager
extension LuckyCardManager: CardManager {
  typealias Card = LuckyCard
  
  // MARK: - Helpers
  func printDeckState(_ deck: LuckyCardDeckImpl, manager: LuckyCardManager) {
    print(deck.description(with: manager))
  }
  
  func makeInitialDeck() -> [Card] {
    let totalCards = Constant.Card.NumberOfCards
    let specificShapeCardsCount = Constant.Card.NumberOfSpecificShapeCards
    return (0..<totalCards)
      .map {
        let moduloPlusOne = ($0 % specificShapeCardsCount) + 1
        switch $0 / specificShapeCardsCount {
        case 0:
          return LuckyCard(
            number: LuckyCardNumberType.rawValue(from: moduloPlusOne) ?? .One, shape: .cat, appearance: .front)
        case 1:
          return LuckyCard(
            number: LuckyCardNumberType.rawValue(from: moduloPlusOne) ?? .One, shape: .cow, appearance: .front)
        case 2:
          return LuckyCard(
            number: LuckyCardNumberType.rawValue(from: moduloPlusOne) ?? .One, shape: .dog, appearance: .front)
        default:
          return LuckyCard(number: LuckyCardNumberType(rawValue: -99999) ?? .One, shape: .cat, appearance: .front)
        }
      }
  }
}
