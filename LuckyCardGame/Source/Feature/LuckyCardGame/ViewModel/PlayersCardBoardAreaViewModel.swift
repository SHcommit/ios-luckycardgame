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
  
  // MARK: - Lifecycle
  init(
    gameManager: LuckyCardGameManager
  ) {
    self.gameManager = gameManager
  }
}

// MARK: - PlayersCardBoardAreaViewModelProtocol
extension PlayersCardboardAreaViewModel: PlayersCardBoardAreaViewModelProtocol {
  var headCount: PlayerHeadCountType {
    gameManager.headCount
  }
  
  func divideCards(in board: PlayerBoardType) -> [Card] {
    return gameManager.divideCardsToPlayer(in: board)
  }
}
