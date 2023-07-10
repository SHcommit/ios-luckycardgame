//
//  LuckyCard.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

final class LuckyCard: Card<LuckyCardShapeType, LuckyCardNumberType> {
  override func description() -> String {
    return "\(shape.description)\(String(format: "%02d", number.rawValue))"
  }
}
