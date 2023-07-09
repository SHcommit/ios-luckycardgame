//
//  PlayerCardBoardViewModel.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/09.
//

import Foundation

final class PlayerCardBoardViewModel {
  // MARK: - Properties
  private(set) var boardType: PlayerBoardType
  private(set) var playerOwnTheDeck: LuckyCardDeckImpl
  private(set) var gameManager: LuckyCardManager
  
  // MARK: - Lifecycle
  init(
    boardType: PlayerBoardType,
    gameManager: LuckyCardManager
  ) {
    self.boardType = boardType
    self.gameManager = gameManager
    playerOwnTheDeck = .init(
      cards: gameManager.luckyCardDeckImpl.divideCards(
        in: boardType,
        with: gameManager.headCount))
    print(playerOwnTheDeck.description(with: gameManager))
  }
}
