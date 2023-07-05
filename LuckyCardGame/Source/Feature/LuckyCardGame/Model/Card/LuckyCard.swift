//
//  LuckyCard.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

final class LuckyCard: Card<LuckyCardShapeType> {
  // MARK: - Lifecycle
  override init(
    number: Int,
    shape: LuckyCardShapeType) {
    super.init(number: number, shape: shape)
  }
}
