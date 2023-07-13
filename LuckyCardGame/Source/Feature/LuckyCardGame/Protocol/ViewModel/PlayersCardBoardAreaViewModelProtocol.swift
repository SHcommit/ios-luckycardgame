//
//  PlayersCardBoardAreaViewModelProtocol.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/09.
//

protocol PlayersCardBoardAreaViewModelProtocol {
  associatedtype Card: LuckyCard
  
  var gameManager: LuckyGame { get }
  var headCount: PlayerHeadCountType { get }
  
  func divideCards(in board: PlayerBoardType) -> [Card]
}
