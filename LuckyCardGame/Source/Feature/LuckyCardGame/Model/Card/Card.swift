//
//  Card.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

/// 모든 카드 종류는 이 카드를 상속받아야 합니다.
/// 카드 숫자는 Int타입입니다.
/// 카드 모양은 게임 유형에 따라 개, 고양이, 말 등이 될 수도 있습니다. 또는 마름모, 원, 하트 등이 될 수 있습니다.
/// Hashable 타입으로 선언해서, CardShapeStorage 클래스를 통해 Shape타입에 해당하는 값을 출력하거나 화면에 보여줄 수 있습니다.
///

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
  func isEqual(_ card: Card) -> Bool {
    return number == card.number && shape == card.shape
  }
  func isEqualShape(_ card: Card) -> Bool {
    return shape == card.shape
  }
}
