//
//  CardShapeStorageProtocol.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import Foundation

protocol CardShapeStorageProtocol  {
  associatedtype Shape: Hashable
  associatedtype Value
  
  func append(_ shape: Shape, _ value: Value)
  func delete(_ shape: Shape)
  func update(
    with shape: Shape,
    _ value: Value)
}
