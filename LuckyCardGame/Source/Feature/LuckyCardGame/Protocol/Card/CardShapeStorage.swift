//
//  CardShapeStorage.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

/// Card는 Shape를 가집니다. 또한 String타입의 값도 갖습니다. Shape의 경우 Hashable로 했는데,
/// enum 타입을 선언하기 용이하기 위해 Hasna
/// 추후 게임 상황에 따라 게임 실행 중 추가되거나 삭제될 수 있다고 판단해 유연하게 다룰 수 있도록 추상화했습니다.
/// ShapeStorage는 **key에 따른 값을 반환** 하거나 shape 추가, 삭제 등의 shapes에 관련된 기능이 있습니다.

/// 카드의 모양은 모양 키 Shape와 값Value를 갖을 수 있습니다.

protocol CardShapeStorage: AnyObject  {
  associatedtype Shape: CardShapeEnumProtocol
  associatedtype Value: StringProtocol
  
  var shapes: [Shape: Value] { get set }
}

extension CardShapeStorage {
  func append(_ value: Value, forKey shape: Shape) {
    shapes[shape] = value
  }
  func delete(_ shape: Shape) {
    shapes.removeValue(forKey: shape)
  }
  func update(_ value: Value, forKey shape: Shape) {
    shapes.updateValue(value, forKey: shape)
  }
}
