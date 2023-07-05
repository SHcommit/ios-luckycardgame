//
//  Card.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import Foundation

class Card<Shape: Hashable> {
  // MARK: - Properties
  var number: Int
  var maximumCardType: Int
  var shape: Shape
  
  // MARK: - Lifecycle
  init(number: Int, maximumCardType: Int, shape: Shape) {
    self.number = number
    self.maximumCardType = maximumCardType
    self.shape = shape
  }
}
