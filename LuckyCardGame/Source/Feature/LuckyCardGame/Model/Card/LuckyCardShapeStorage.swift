//
//  CardShapeStorage.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import Foundation

protocol CardShapeStorageProtocol  {
  associatedtype Shape
  func append(_ shapeType: CardShapeType, _ shape: Shape)
  func delete(_ shapeType: CardShapeType)
  func update(
    with shapeType: CardShapeType,
    _ shape: Shape)
  
}

final class CardShapeStorage<Shape> {
  private(set) var shapes: [CardShapeType:Shape] = [:]
  var count: Int {
    shapes.count
  }
}

// MARK: - CardShapeStorageProtocol
extension CardShapeStorage: CardShapeStorageProtocol {
  typealias Shape = Shape
  
  func append(_ shapeType: CardShapeType, _ shape: Shape) {
    shapes.updateValue(shape, forKey: shapeType)
  }
  
  func delete(_ shapeType: CardShapeType) {
    shapes.removeValue(forKey: shapeType)
  }
  
  func update(with shapeType: CardShapeType, _ shape: Shape) {
    shapes.updateValue(shape, forKey: shapeType)
  }
}
