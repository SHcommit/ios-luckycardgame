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
  
  var playerCardsCountInBoard: Int {
    switch self {
    case .three: return 8
    case .four: return 7
    case .five: return 6
    }
  }
  
  var bottomCardsCountInBoard: Int {
    switch self {
      //12번 3장 버려야 한다.
    case .three: return 9
    case .four: return 8
    case .five: return 6
    }
  }
  
  // Footer일 떄, 가로로 한 줄일 때 카드 놓일 개수
  var bottomCardsCountInOneHoriLine: Int {
    switch self {
    case .three: return 5
    case .four: return 4
    case .five: return 6
    }
  }
  
  // Footer일 때 세로로 한 줄 놓일 때 카드 개수
  var bottomCardsCountInOneVertiLine: Int {
    switch self {
    case .three: return 2
    case .four: return 2
    case .five: return 1
    }
  }
  
  var toCaseIterableIdx: Int {
    self.toInt - PlayerHeadCountType.Constant.minHeadCount
  }
  
  static var caseCount: Int {
    PlayerHeadCountType.allCases.count
  }
  
  static var maximumHeadCountToInt: Int {
    PlayerHeadCountType.five.toInt
  }
  
  static var notificationUserInfoKey: String {
    String(describing: PlayerHeadCountType.self)
  }
}

// MARK: - CustomStringConvertible
extension PlayerHeadCountType: CustomStringConvertible {
  var description: String {
    return "\(self.toInt)명"
  }
}
