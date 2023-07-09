//
//  CardShapeStorageImpl.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import Foundation

final class LuckyCardShapeStorageImpl: CardShapeStorage {
  // MARK: - Constant
  typealias Shape = LuckyCardShapeType
  typealias Value = String
 
  // MARK: - Properties
  var shapes: [Shape:Value] = [:]
  
  var count: Int {
    shapes.count
  }
  
  // MARK: - Lifecycle
  init(shapes: [Shape : Value]) {
    self.shapes = shapes
  }
}
