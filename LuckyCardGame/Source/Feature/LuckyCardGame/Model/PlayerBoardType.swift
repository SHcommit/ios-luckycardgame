//
//  PlayerBoardType.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import Foundation

enum PlayerBoardType {
  case A, B, C, D, E
  
  var toString: String{
    switch self {
    case .A: return "A"
    case .B: return "B"
    case .C: return "C"
    case .D: return "D"
    case .E: return "E"
    }
  }
}
