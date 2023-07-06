//
//  PlayerBoardType.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

/// Player의 카드 보드 타입입니다. 
import Foundation

enum PlayerBoardType {
  case A, B, C, D, E
}

// MARK: - CustomStringConvertible
extension PlayerBoardType: CustomStringConvertible {
  var description: String {
    switch self {
    case .A: return "A"
    case .B: return "B"
    case .C: return "C"
    case .D: return "D"
    case .E: return "E"
    }
  }
}
