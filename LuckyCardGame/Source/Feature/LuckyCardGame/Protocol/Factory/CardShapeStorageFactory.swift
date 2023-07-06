//
//  CardShapeStorageFactory.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import Foundation

protocol CardShapeStorageFactory {
  associatedtype Shape: Hashable
  associatedtype Value: Any
  
  func make(shapes: [Shape: Value]) -> CardShapeStorageImpl<Shape,Value>
}
