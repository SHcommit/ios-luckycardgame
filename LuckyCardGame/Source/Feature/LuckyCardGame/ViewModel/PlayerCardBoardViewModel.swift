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
  private(set) var gameManager: LuckyCardGameManager
  
  // MARK: - Lifecycle
  init(
    boardType: PlayerBoardType,
    gameManager: LuckyCardGameManager
  ) {
    self.boardType = boardType
    self.gameManager = gameManager
  }
}

// MARK: - PlayerCardBoardViewModelProtocol
extension PlayerCardBoardViewModel: PlayerCardBoardViewModelProtocol {
  func playerCardsCountInBoard() -> Int {
    return gameManager.headCount.playerCardsCountInBoard
  }
  
  func playerHeadCount() -> PlayerHeadCountType {
    return gameManager.headCount
  }
  
  func showPlayerCard(_ idx: Int) -> LuckyCard {
    return gameManager
      .showPlayerCard(
        with: boardType,
        at: idx)
    
  }
}
