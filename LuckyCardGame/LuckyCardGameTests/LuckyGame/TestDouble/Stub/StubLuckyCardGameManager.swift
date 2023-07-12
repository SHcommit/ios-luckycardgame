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
  typealias Card = LuckyCard
  
  typealias CardDeck = LuckyCardDeckImpl
  
  let numberOfCards = LuckyCardGameManager
    .Constant
    .LuckyCard
    .numberOfCards
  
  let numberOFShapes = LuckyCardGameManager
    .Constant
    .LuckyCard
    .numberOfSpecificShapeCards
  
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
  ) -> [LuckyCard] { return [] }
  func divideRemainingCardsToFooter() -> [LuckyCard] {
    return []
  }
}
