//
//  LuckyCardViewModel.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/08.
//

import Foundation

final class LuckyCardViewModel {
  private let gameManager: LuckyCardManager
  private let cardModel: Card<LuckyCardShapeType, LuckyCardNumberType>
  
  init(
    gameManager: LuckyCardManager,
    cardModel: Card<LuckyCardShapeType, LuckyCardNumberType>
  ) {
    self.gameManager = gameManager
    self.cardModel = cardModel
  }
}

extension LuckyCardViewModel: LuckyCardViewModelProtocol {
  var shape: String {
    gameManager.shapeStorage.shapes[cardModel.shape] ?? ""
  }
  
  var number: String {
    cardModel.number.rawValue.description
  }
}
