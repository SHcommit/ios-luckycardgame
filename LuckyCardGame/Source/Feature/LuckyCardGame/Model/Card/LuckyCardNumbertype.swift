//
//  LuckyCardNumbertype.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/07.
//

/// 카드 넘버 타입은 식별 가능함과 동시에 number가 아닌 문자 등을 반환할 수 있는 enum 구조체로 선정했습니다.
enum LuckyCardNumberType: Int, CaseIterable, CardNumberEnumProtocol {
  case one = 1
  case two
  case three
  case four
  case five
  case six
  case seven
  case eight
  case nine
  case ten
  case eleven
  case twelve
}

// MARK: - Helper
extension LuckyCardNumberType {
  static func rawValue(from number: Int) -> LuckyCardNumberType? {
    return LuckyCardNumberType.allCases.first { $0.rawValue == number }
  }
}

// MARK: - Comparable
extension LuckyCardNumberType: Comparable {
  static func < (lhs: LuckyCardNumberType, rhs: LuckyCardNumberType) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }
}

// MARK: - Equatable
extension LuckyCardNumberType: Equatable {
  static func == (lhs: LuckyCardNumberType, rhs: LuckyCardNumberType) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }
}
