//
//  Card.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

class Card<Shape: CardShapeEnumProtocol, Number: CardNumberEnumProtocol> {
  // MARK: - Model
  enum Appearance {
    case front
    case rear
  }
  
  // MARK: - Properties
  private(set) var number: Number
  private(set) var shape: Shape
  private(set) var appearance: Appearance
  
  // MARK: - Lifecycle
  init(number: Number, shape: Shape, appearance: Appearance) {
    self.number = number
    self.shape = shape
    self.appearance = appearance
  }
}

// MARK: - Helper
extension Card {
  func flip(to newApperance: Appearance) {
    if appearance != newApperance {
      appearance = newApperance
    }
  }
  
  func isLargerThan(_ card: Card) -> Bool {
    number > card.number
  }
  
  func isEqualNumber(_ card: Card) -> Bool {
    return number == card.number
  }
  
  func isEqualShape(_ card: Card) -> Bool {
    return shape.rawValue == card.shape.rawValue
  }
  
  /// Card's info with strnig
  func description() -> String {
    fatalError("If use this method, must override this func :)")
  }
}
