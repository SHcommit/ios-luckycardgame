//
//  PlayerCardBoardViewModelProtocol.swift
//  LuckyCardGameTests
//
//  Created by 양승현 on 2023/07/11.
//

import Foundation

protocol PlayerCardBoardViewModelProtocol {
  
  var boardType: PlayerBoardType { get }
  var player: Player { get }
  var gameManager: LuckyCardGameManager { get }
  
  func showPlayerCard(_ idx: Int) -> LuckyCard
  func playerHeadCount() -> PlayerHeadCountType
  func playerCardsCountInBoard() -> Int
}
