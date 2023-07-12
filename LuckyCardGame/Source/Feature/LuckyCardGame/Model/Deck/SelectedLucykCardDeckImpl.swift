//
//  SelectedLucykCardDeckImpl.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/11.
//

/// SelectedLuckyCardDeckImpl
/// Notes:
/// 1. 사용자가 선택핸 Deck을 관리하는 CardDeck입니다.
final class SelectedLuckyCardDeckImpl: Deck {
  // MARK: - Constant
  typealias Card = LuckyCard
  
  // MARK: - Properties
  var cards: [LuckyCard] = []
  
  var description: String {
    return cards
      .map { $0.description() }
      .joined(separator: ", ")
  }
  
  // MARK: - Lifecycle
  init(cards: [LuckyCard]) {
    self.cards = cards
  }
}
