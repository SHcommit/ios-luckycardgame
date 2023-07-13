//
//  LuckyCardViewModel.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/08.
//

import Foundation

final class LuckyCardViewModel {
  // MARK: - Properteis
  private let gameManager: LuckyGame
  private let cardModel: LuckyCard
  
  // MARK: - Lifecycle
  init(
    gameManager: LuckyGame,
    cardModel: LuckyCard
  ) {
    self.gameManager = gameManager
    self.cardModel = cardModel
  }
}

// MARK: - LuckyCardViewModelProtocol
extension LuckyCardViewModel: LuckyCardViewModelProtocol {
  var shape: String {
    cardModel.shape.description
  }
  
  var number: String {
    cardModel.number.rawValue.description
  }
}
