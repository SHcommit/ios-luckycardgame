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
class Card<Shape: Hashable> {
  // MARK: - Properties
  var number: Int
  var shape: Shape
  
  // MARK: - Lifecycle
  init(number: Int, shape: Shape) {
    self.number = number
    self.shape = shape
  }
}

// MARK: - CardConvertible
extension Card: CardConvertible {
  // 추후 에러 처리TODO: - CardShapeStorage error 처리
  func description(with cardShapeStorage: CardShapeStorageImpl<Shape, String>) -> String {
    let shape = cardShapeStorage.shapes[shape] ?? ""
    return "\(shape.toUnicodeTypeString())\(String(format: "%02d", number))"
  }
}
