//
//  Player.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/10.
//

import Foundation

final class Player {
  // MARK: - Properties
  private(set) var cardDeck: LuckyCardDeckImpl
  private(set) var selectedCardDeck: SelectedLuckyCardDeckImpl?
  
  // MARK: - Lifecycle
  init(
    cardDeck: LuckyCardDeckImpl,
    selectedCardDeck: SelectedLuckyCardDeckImpl
  ) {
    self.cardDeck = cardDeck
    self.selectedCardDeck = selectedCardDeck
  }
}

// MARK: - Helepr
extension Player {
  // 사용자는 카드를 보여줄 수 있다. 그러나 게임 메니저에 의해 제약되야 한다.
  func showMyCard(_ index: Int) -> LuckyCard {
    return cardDeck.cards[index]
  }
}
