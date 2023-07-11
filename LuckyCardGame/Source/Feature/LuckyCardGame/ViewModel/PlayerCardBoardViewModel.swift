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
  private(set) var gameManager: LuckyCardGameManager
  
  // MARK: - Lifecycle
  init(
    boardType: PlayerBoardType,
    gameManager: LuckyCardGameManager
  ) {
    self.boardType = boardType
    self.gameManager = gameManager
    let playerOwnTheDeck: LuckyCardDeckImpl = .init(
      cards: gameManager.divideCardsToPlayer(in: boardType))
    self.player = .init(cardDeck: playerOwnTheDeck)
  }
}

extension PlayerCardBoardViewModel: PlayerCardBoardViewModelProtocol {
  func showPlayerCard(_ idx: Int) -> LuckyCard {
    return player.showMyCard(idx)
  }
}
