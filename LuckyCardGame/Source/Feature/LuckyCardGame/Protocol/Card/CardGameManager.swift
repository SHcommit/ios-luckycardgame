//
//  CardManager.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/07.
//

protocol CardGameManager {
  associatedtype Card
  associatedtype CardDeck: Deck
  
  func initCardDeck() -> [Card]
  func printCardDeckDescription()
  func divideCardsToPlayer(in board: PlayerBoardType) -> [Card]
  func divideRemainingCardsToPlayer() -> [Card]
}
