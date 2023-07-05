//
//  CardShapeStorageFactory.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import Foundation

final class CardShapeStorageFactoryImpl<Shape: Hashable, Value: Any>: CardShapeStorageFactory {
  func make(shapes: [Shape : Value]) -> CardShapeStorageImpl<Shape, Value> {
    return CardShapeStorageImpl(shapes: shapes)
  }
}
