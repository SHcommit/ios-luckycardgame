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
  private(set) var gameManager: LuckyCardManager
  
  // MARK: - Lifecycle
  init(
    gameManager: LuckyCardManager
  ) {
    self.gameManager = gameManager
    // 남은 카드들
    remainingDeck = .init(
      cards: gameManager.luckyCardDeckImpl.divideBottomCards(with: gameManager.headCount))
  }
}
