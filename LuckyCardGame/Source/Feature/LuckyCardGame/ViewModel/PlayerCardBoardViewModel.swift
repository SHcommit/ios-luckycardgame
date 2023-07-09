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
  private(set) var player: Player
  private(set) var gameManager: LuckyCardManager
  
  // MARK: - Lifecycle
  init(
    boardType: PlayerBoardType,
    gameManager: LuckyCardManager
  ) {
    self.boardType = boardType
    self.gameManager = gameManager
    let playerOwnTheDeck: LuckyCardDeckImpl = .init(
      cards: gameManager.luckyCardDeckImpl.divideCards(
        in: boardType,
        with: gameManager.headCount))
    self.player = .init(cardDeck: playerOwnTheDeck)
  }
}

extension PlayerCardBoardViewModel {
  func showPlayerCard(_ idx: Int) -> LuckyCard {
    return player.showMyCard(idx)
  }
}
