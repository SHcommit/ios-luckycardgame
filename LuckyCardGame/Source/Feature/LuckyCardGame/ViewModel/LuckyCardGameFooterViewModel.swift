//
//  LuckyCardGameFooterViewModel.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/09.
//

import Foundation

final class LuckyCardGameFooterViewModel {
  // MARK: - Properties
  private(set) var remainingDeck: LuckyCardDeckImpl
  private(set) var gameManager: LuckyCardGameManager
  
  // MARK: - Lifecycle
  init(
    gameManager: LuckyCardGameManager
  ) {
    self.gameManager = gameManager

    remainingDeck = .init(
      cards:
        gameManager.divideRemainingCardsToFooter())
  }
}
