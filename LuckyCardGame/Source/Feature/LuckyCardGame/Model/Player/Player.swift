//
//  Player.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/10.
//

import Foundation

final class Player {
  private(set) var cardDeck: LuckyCardDeckImpl
  
  init(cardDeck: LuckyCardDeckImpl) {
    self.cardDeck = cardDeck
  }
}

extension Player {
  func showMyCard(_ index: Int) -> LuckyCard {
    return cardDeck.cards[index]
  }
}
