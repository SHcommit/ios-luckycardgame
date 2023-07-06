//
//  LuckyCardManager.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

import Foundation

/// LuckyCard, LuckyCardDeck을 관리할 수 있는 manager입니다. 앞에 언급한 두 인스턴스는 존재하지 않습니다.
final class LuckyCardManager {
  // MARK: - Constant
  struct Constant {
    enum GameSetting {
      static let NumberOfCards = 36
      static let NumberOfSpecificShapeCards = 12
    }
  }
  
  // MARK: - Properties
  typealias Shape = LuckyCardShapeType
  
  static let shared = LuckyCardManager()
  
  let shapeStorage: CardShapeStorageImpl<Shape, String> = {
    let shapes: [Shape: String] = [.cat: "U+1F431", .cow: "U+1F42E", .dog: "U+1F436"]
    let factory = CardShapeStorageFactoryImpl<Shape, String>()
    return factory.make(shapes: shapes)
  }()
  
  // MARK: - Lifecycle
  private init() {}
}

// MARK: - Helpers
extension LuckyCardManager {
  func printDeckState(_ luckyCardDeck: LuckyCardDeckImpl) {
    print(luckyCardDeck.description)
  }
  
  func setInitialLuckyCardDeck() -> [LuckyCard] {
    let totalCards = Constant.GameSetting.NumberOfCards
    let specificShapeCardsCount = Constant.GameSetting.NumberOfSpecificShapeCards
    return (0..<totalCards)
      .map {
        let moduloPlusOne = ($0 % specificShapeCardsCount) + 1
        switch $0 / specificShapeCardsCount {
        case 0:
          return LuckyCard(
            number: moduloPlusOne, shape: .cat)
        case 1:
          return LuckyCard(
            number: moduloPlusOne, shape: .cow)
        case 2:
          return LuckyCard(
            number: moduloPlusOne, shape: .dog)
        default:
          return LuckyCard(number: -99999, shape: .cat)
        }
      }
  }
}
