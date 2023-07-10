//
//  Card.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

/// 다형성을 고려한 base card.
///
/// Notes:
/// 1. 포커Card, LuckyCard 등 다양한 카드들은 공통적으로 모양, 숫자가 있습니다.
/// 2. 두 제너릭 타입은 각각 특징이 다른데, 전자의 경우 enum타입만 올 수 있도록, RawRepresentable을 준수했습니다.
///   후자의 경우 Equatable, Comparable을 준수해 카드간 대소비교, 동등비교가 가능하도록 구현했습니다.
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
  
  /// Card's info with strnig
  func description() -> String {
    fatalError("If use this method, must override this func :)")
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
}
