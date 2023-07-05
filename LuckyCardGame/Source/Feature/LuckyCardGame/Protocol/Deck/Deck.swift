//
//  Deck.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

import Foundation

protocol Deck: DeckConvertible {
  associatedtype Card
  
  var cards: [Card] { get }
  
  func shuffle()
  func append(_ card: Card)
  func insert( _ card: Card, at index: Int) throws
  func removeLast() throws -> Card
  func remove(at index: Int) throws -> Card
}

protocol DeckConvertible {
  var description: String { get }
}
