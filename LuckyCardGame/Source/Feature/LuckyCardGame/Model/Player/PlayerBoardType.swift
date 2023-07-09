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

// MARK: - Helper
extension PlayerBoardType {
  private var toInt: Int {
    switch self {
    case .A: return 0
    case .B: return 1
    case .C: return 2
    case .D: return 3
    case .E: return 4
    }
  }
  
  func toIndex(with headCount: PlayerHeadCountType) -> Int {
    return self.toInt * headCount.playerCardsCountInBoard
  }
}
