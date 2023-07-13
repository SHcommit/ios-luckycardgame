//
//  StubLuckyCardGameManager.swift
//  LuckyCardGameTests
//
//  Created by 양승현 on 2023/07/12.
//

import Foundation
@testable import LuckyCardGame

/// 플레이어 인원 5명일 경우로 가정했습니다.
final class StubLuckyCardGameManager: CardGameManager {
  // MARK: - Constant
  typealias CardShape = LuckyCardShapeType
  typealias CardNumber = LuckyCardNumberType
  typealias _Card = LuckyCard
  
  typealias CardDeck = LuckyCardDeckImpl
  
  let numberOfCards = LuckyCardGameManager
    .Constant
    .LuckyCard
    .numberOfCards
  
  let numberOFShapes = LuckyCardGameManager
    .Constant
    .LuckyCard
    .numberOfSpecificShapeCards
  
  let playerOwnCardsCount = PlayerHeadCountType
    .five
    .playerCardsCountInBoard
  
  // MARK: - Properties
  var headCount: LuckyCardGame.PlayerHeadCountType
  
  var cardDeck: LuckyCardGame.LuckyCardDeckImpl?
  
  init(
    headCount: PlayerHeadCountType,
    cardDeck: LuckyCardDeckImpl? = nil
  ) {
    self.headCount = headCount
    self.cardDeck = cardDeck
  }
  
  // MARK: - Helper
  func initCardDeck() -> [LuckyCardGame.LuckyCard] {
    let catCardDeck = LuckyCardNumberType.allCases.map {
      return LuckyCard(number: $0, shape: .cat, appearance: .front)
    }
    let cowCardDeck = LuckyCardNumberType.allCases.map {
      return LuckyCard(number: $0, shape: .cow, appearance: .front)
    }
    let dogCardDeck = LuckyCardNumberType.allCases.map {
      return LuckyCard(number: $0, shape: .dog, appearance: .front)
    }
    
    return catCardDeck + cowCardDeck + dogCardDeck
  }
  
  // MARK: - Helper
  func printCardDeckDescription() { print() }
  func divideCardsToPlayer(
    in board: PlayerBoardType
  ) -> [LuckyCard] {
    guard let cardDeck = cardDeck else { return [] }
    let boardHeadCount = board.toIndex(with: .five)
    
    return (boardHeadCount..<boardHeadCount+headCount.toInt)
      .map { cardDeck.cards[$0] }
    
  }
  func divideRemainingCardsToFooter() -> [LuckyCard] {
    guard let cardDeck = cardDeck else { return [] }
    let start = numberOfCards - headCount.bottomCardsCountInBoard
    let end = headCount.bottomCardsCountInBoard
    
    return (start..<end).map { cardDeck.cards[$0] }
  }
  
  func showAllPlayerCards() -> [_Card] {
    guard let _=cardDeck else { return [] }
    return [
      divideCardsToPlayer(in: .A),
      divideCardsToPlayer(in: .B),
      divideCardsToPlayer(in: .C),
      divideCardsToPlayer(in: .D),
      divideCardsToPlayer(in: .E)
    ].flatMap { $0 }
  }
}
