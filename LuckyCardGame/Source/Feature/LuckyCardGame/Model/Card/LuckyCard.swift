//
//  LuckyCard.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import Foundation

final class LuckyCard: Card<LuckyCardShapeType> {
  // MARK: - Constant
  struct Constant {
    static let MaximumCardNumType = 12
  }
  
  // MARK: - Lifecycle
  override init(
    number: Int,
    maximumCardType: Int = Constant.MaximumCardNumType,
    shape: LuckyCardShapeType) {
    super.init(number: number, maximumCardType: maximumCardType, shape: shape)
  }
}
