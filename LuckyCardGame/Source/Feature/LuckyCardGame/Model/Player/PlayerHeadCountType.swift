//
//  PlayerHeadCountType.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

/// Player는 3명에서 5명까지 가능합니다.
enum PlayerHeadCountType: CaseIterable {
  // MARK: - Constant
  struct Constant {
    static let minHeadCount: Int = 3
  }
  
  // MARK: - Case
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
  
  var toCaseIterableIdx: Int {
    self.toInt - PlayerHeadCountType.Constant.minHeadCount
  }
  
  static var count: Int {
    PlayerHeadCountType.allCases.count
  }
}

// MARK: - CustomStringConvertible
extension PlayerHeadCountType: CustomStringConvertible {
  var description: String {
    return "\(self.toInt)명"
  }
}
