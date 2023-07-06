//
//  LuckyCard.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

final class LuckyCard: Card<LuckyCardShapeType, LuckyCardNumberType> {
  func description(with shapeStorage: LuckyCardShapeStorageImpl) -> String {
    let shape = shapeStorage.shapes[shape] ?? ""
    return "\(shape.toUnicodeTypeString())\(String(format: "%02d", number.rawValue))"
  }
}
