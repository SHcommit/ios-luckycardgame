//
//  MockLuckyCardGameManager.swift
//  LuckyCardGameTests
//
//  Created by 양승현 on 2023/07/12.
//

@testable import LuckyCardGame

class MockLuckyCardGameManager: CardGameManager {
  // MARK: - Constant
  typealias Card = LuckyCard
  
  typealias CardDeck = LuckyCardDeckImpl
  
  // MARK: - Properties
  private(set) var cardDeck: LuckyCardDeckImpl?
  private(set) var headCount: PlayerHeadCountType
  
  init(
    cardDeck: CardDeck,
    headCount: PlayerHeadCountType
  ) {
    self.cardDeck = cardDeck
    self.headCount = headCount
  }
}

// MARK: - Helper
extension MockLuckyCardGameManager {
  // Use stub lucky card game manager
  func initCardDeck() -> [Card] { [] }
  
  // Use stub lucky card game manager
  func printCardDeckDescription() { }
  
  func divideCardsToPlayer(
    in board: PlayerBoardType
  ) -> [Card] {
    guard let cardDeck = cardDeck else {
      print("DEBUG: CardDeck instance isn't allocated.")
      return []
    }
    let start = board.toIndex(with: headCount)
    let end = start + headCount.playerCardsCountInBoard
    return (start..<end).map { cardDeck.cards[$0] }
    
  }
  
  func divideRemainingCardsToFooter() -> [Card] {
    guard let cardDeck = cardDeck else {
      print("DEBUG: CardDeck instance isn't allocated.")
      return []
    }
    let start = headCount.playerCardsCountInBoard*headCount.toInt
    let end = start + headCount.bottomCardsCountInBoard
    return (start..<end).map { cardDeck.cards[$0] }
  }
}
