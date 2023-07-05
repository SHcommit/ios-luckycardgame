//
//  CardShapeStorageProtocol.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

/// 카드의 모양은 모양 키 Shape와 값Value를 갖을 수 있습니다.
protocol CardShapeStorageProtocol  {
  associatedtype Shape: Hashable
  associatedtype Value
  
  func append(_ shape: Shape, _ value: Value)
  func delete(_ shape: Shape)
  func update(
    with shape: Shape,
    _ value: Value)
}
