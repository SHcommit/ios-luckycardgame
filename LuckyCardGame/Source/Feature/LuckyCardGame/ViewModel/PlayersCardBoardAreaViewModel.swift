//
//  PlayersCardBoardAreaViewModel.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/09.
//

import Foundation

final class PlayersCardboardAreaViewModel {
  // MARK: - Constant
  typealias Card = LuckyCard
  
  // MARK: - Properties
  // 참조를 통해.. 상위 객채와 카드 공유..
  private(set) var gameManager: LuckyCardGameManager
  private(set) var playerHeadCount: PlayerHeadCountType
  
  // MARK: - Lifecycle
  init(
    gameManager: LuckyCardGameManager,
    playerHeadCount: PlayerHeadCountType
  ) {
    self.gameManager = gameManager
    self.playerHeadCount = playerHeadCount
  }
}

// MARK: - PlayersCardBoardAreaViewModelProtocol
extension PlayersCardboardAreaViewModel: PlayersCardBoardAreaViewModelProtocol {
  
  func divideCards(in board: PlayerBoardType) -> [Card] {
    return gameManager.divideCardsToPlayer(in: board)
  }
}
