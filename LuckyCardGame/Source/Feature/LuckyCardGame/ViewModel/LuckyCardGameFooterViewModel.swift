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
  private(set) var gameManager: LuckyGame
  
  // MARK: - Lifecycle
  init(
    gameManager: LuckyGame
  ) {
    self.gameManager = gameManager

    remainingDeck = .init(
      cards:
        gameManager.divideRemainingCardsToFooter())
  }
}

// MARK: - Helper
extension LuckyCardGameFooterViewModel {
  var bottomCardsCountInOneHorizontalLine: Int {
    gameManager.headCount.bottomCardsCountInOneHoriLine
  }
  
  var bottomCardsCountInOneVerticalLine: Int {
    gameManager.headCount.bottomCardsCountInOneVertiLine
  }
  
  var headCount: PlayerHeadCountType {
    gameManager.headCount
  }
  
  var bottomCardsCountInBoard: Int {
    gameManager.headCount.bottomCardsCountInBoard
  }
  
  var remainingCards: [LuckyCard] {
    remainingDeck.cards
  }
}
