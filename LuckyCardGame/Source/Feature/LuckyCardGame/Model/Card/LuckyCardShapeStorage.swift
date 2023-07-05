//
//  CardShapeStorage.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import Foundation

/// Card는 Shape를 가질 수 있습니다. 특정 Card에서 보여질 수 있는 모든 shape를 저장합니다.
/// 추후 게임 상황에 따라 게임 실행 중 추가되거나 삭제될 수 있다고 판단해 유연하게 다룰 수 있도록 추상화했습니다.
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
