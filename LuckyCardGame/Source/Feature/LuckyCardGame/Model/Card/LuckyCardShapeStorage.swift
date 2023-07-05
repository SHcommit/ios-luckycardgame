//
//  CardShapeStorage.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import Foundation

class CardShapeStorage<Shape: Hashable, Value: Any> :CardShapeStorageProtocol {
  
  private(set) var shapes: [Shape:Value] = [:]
  var count: Int {
    shapes.count
  }
  
  init(shapes: [Shape : Value]) {
    self.shapes = shapes
  }
}

// MARK: - CardShapeStorageProtocol
extension CardShapeStorage {
  func delete(_ shape: Shape) {
    shapes.removeValue(forKey: shape)
  }
  
  func append(_ shape: Shape, _ value: Value) {
    shapes.updateValue(value, forKey: shape)
  }
  
  func update(with shape: Shape, _ value: Value) {
    append(shape, value)
  }
}
