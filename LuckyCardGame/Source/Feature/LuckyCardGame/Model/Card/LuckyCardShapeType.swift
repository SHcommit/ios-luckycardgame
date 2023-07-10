//
//  CardShapeType.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import Foundation

/// LuckyCard는 세가지 중 한가지만 갖으면 되기 때문에 enum으로 정의했습니다.
enum LuckyCardShapeType: CardShapeEnumProtocol {
  case dog
  case cat
  case cow
}
