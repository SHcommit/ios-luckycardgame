//
//  LuckyCardNumbertype.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/07.
//

/// 카드 넘버 타입은 식별 가능함과 동시에 number가 아닌 문자 등을 반환할 수 있는 enum 구조체로 선정했습니다.
enum LuckyCardNumberType: Int, CaseIterable {
  case One
  case Two
  case Three
  case Four
  case Five
  case Six
  case Seven
  case Eight
  case Nine
  case Ten
  case eleven
  case twelve
  
  static func rawValue(from number: Int) -> LuckyCardNumberType? {
    return LuckyCardNumberType.allCases.first { $0.rawValue == number }
  }
}
