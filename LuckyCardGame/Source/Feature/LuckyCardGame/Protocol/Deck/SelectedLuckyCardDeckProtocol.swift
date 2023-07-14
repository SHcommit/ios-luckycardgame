//
//  SelectedLuckyCardDeckProtocol.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/13.
//

protocol SelectedLuckyCardDeckProtocol: Deck { }

extension SelectedLuckyCardDeckProtocol {
  func add(_ card: Card) {
    cards.append(card)
  }
  
  func clearCardDeck() {
    clearDeck()
  }
  
  func isCardDeckItemsAllSame() -> Bool {
    return cards[0] == cards[1] ? cards[1] == cards[2] : false
  }
}
