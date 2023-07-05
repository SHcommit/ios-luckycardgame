//
//  CardConvertible.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

protocol CardConvertible {
  associatedtype Shape: Hashable
  associatedtype Value
  
  func description(with cardShapeStorage: CardShapeStorageImpl<Shape, Value>) -> String
}
