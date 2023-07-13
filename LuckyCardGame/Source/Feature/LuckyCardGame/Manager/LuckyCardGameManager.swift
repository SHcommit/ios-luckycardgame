//
//  LuckyCardGameManager.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

import Foundation
import Combine

final class LuckyCardGameManager: CardGameManager {
  // MARK: - Constant
  struct Constant {
    enum LuckyCard {
      static let numberOfCards = 36
      static let numberOfSpecificShapeCards = 12
    }
  }
  typealias CardShape = LuckyCardShapeType
  typealias CardNumber = LuckyCardNumberType
  typealias _Card = LuckyCard
  typealias CardDeck = LuckyCardDeckImpl
  
  // MARK: - Properties
  private(set) var headCount: PlayerHeadCountType
  
  private(set) var ownerPlayer: Player = .init(
    cardDeck: .init(cards: []),
    selectedCardDeck: .init(cards: []))
  
  private(set) var otherPlayers: [Player] = [
    .init(
      cardDeck: .init(cards: []),
      selectedCardDeck: .init(cards: []))]
  
  var cardDeck: LuckyCardDeckImpl? {
    luckyCardDeckImpl
  }
  
  @Published private(set) var luckyCardDeckImpl: CardDeck?
  
  private let totalCards = Constant.LuckyCard.numberOfCards
  
  private let specificShapeCardsCount = Constant
    .LuckyCard
    .numberOfSpecificShapeCards
  
  private var subscription: AnyCancellable?
  
  // MARK: - Lifecycle
  init(headCount: PlayerHeadCountType) {
    self.headCount = headCount
    let boardTypes: [PlayerBoardType] = [
      .A, .B, .C, .D, .E]
    
    let luckyCardDeckImpls = boardTypes.map {
      return LuckyCardDeckImpl(
        cards: divideCardsToPlayer(in: $0))
    }
    ownerPlayer = .init(
      cardDeck: luckyCardDeckImpls[0],
      selectedCardDeck: .init(cards: []))
    
    otherPlayers = (1..<boardTypes.count).map {
      return Player(
        cardDeck: luckyCardDeckImpls[$0],
        selectedCardDeck: .init(cards: []))
    }
    bind()
    luckyCardDeckImpl = LuckyCardDeckImpl(
      cards: initCardDeck())
  }
}

// MARK: - Private helper
private extension LuckyCardGameManager {
  func bind() {
    subscription = $luckyCardDeckImpl
      .receive(on: RunLoop.main)
      .sink { [unowned self] _ in
        printCardDeckDescription()
        subscription = nil
      }
  }

  func initLuckyCard(
    number: Int,
    shape: LuckyCardShapeType
  ) -> LuckyCard {
    return LuckyCard(
      number: LuckyCardNumberType(rawValue: number) ?? .one,
      shape: shape,
      appearance: .front)
  }
  
  func initLuckyCard(
    by target: Int,
    cardNumber: Int
  ) -> LuckyCard {
    switch target {
    case 0:
      return initLuckyCard(
        number: cardNumber,
        shape: .cat)
    case 1:
      return initLuckyCard(
        number: cardNumber,
        shape: .cow)
    case 2:
      return initLuckyCard(
        number: cardNumber,
        shape: .dog)
    default:
      return initLuckyCard(
        number: -999999999,
        shape: .cat)
    }
  }
}

// MARK: - CardManager
extension LuckyCardGameManager {
  func printCardDeckDescription() {
    guard let luckyCardDeckImpl = luckyCardDeckImpl else {
      return
    }
    print(luckyCardDeckImpl.description)
  }
  
  func initCardDeck() -> [_Card] {
    var allCards = (0..<totalCards)
      .map {
        let moduloPlusOne = ($0 % specificShapeCardsCount) + 1
        let target = $0/specificShapeCardsCount
        return initLuckyCard(
          by: target,
          cardNumber: moduloPlusOne)
        }
    if headCount == .three {
      allCards.removeAll(where: {$0.number.rawValue == 12})
    }
    return allCards
  }

  func divideCardsToPlayer(
    in board: PlayerBoardType
  ) -> [LuckyCard] {
    let start = board.toIndex(with: headCount)
    let end = start + headCount.playerCardsCountInBoard
    guard let luckyCardDeckImpl = luckyCardDeckImpl else {
      print("DEBUG: Not initialization luckyCardImpl...")
      return []
    }
    return (start..<end)
      .map {
        
        luckyCardDeckImpl.cards[$0]
      }
  }
  
  func divideRemainingCardsToFooter() -> [LuckyCard] {
    let start = headCount.playerCardsCountInBoard*headCount.toInt
    let end = start + headCount.bottomCardsCountInBoard
    guard let luckyCardDeckImpl = luckyCardDeckImpl else {
      print("DEBUG: Not initialization luckyCardImpl...")
      return []
    }
    return (start..<end)
      .map {
        luckyCardDeckImpl.cards[$0]
      }
  }
}
