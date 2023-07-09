//
//  PlayersCardBoardAreaViewModelProtocol.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/09.
//

protocol PlayersCardBoardAreaViewModelProtocol {
  associatedtype Card
  
  func divideCards(
    in board: PlayerBoardType,
    with headCount: PlayerHeadCountType) -> [Card]
}
