//
//  PlayerHeadCountType.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

enum PlayerHeadCountType {
  case three
  case four
  case five
  
  var toInt: Int {
    switch self {
    case .three: return 3
    case .four: return 4
    case .five: return 5
    }
  }
}
