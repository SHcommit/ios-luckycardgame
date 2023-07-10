//
//  PlayersCardBoardAreaViewModelProtocol.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/09.
//

protocol PlayersCardBoardAreaViewModelProtocol {
  associatedtype Card
  
  var gameManager: LuckyCardManager { get }
  var playerHeadCount: PlayerHeadCountType { get }
  
  func divideCards(
    in board: PlayerBoardType,
    with headCount: PlayerHeadCountType) -> [Card]
}
