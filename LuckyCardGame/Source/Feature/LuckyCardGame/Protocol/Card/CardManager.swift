//
//  CardManager.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/07.
//

protocol CardManager {
  associatedtype Card
  
  func makeInitialDeck() -> [Card]
}
