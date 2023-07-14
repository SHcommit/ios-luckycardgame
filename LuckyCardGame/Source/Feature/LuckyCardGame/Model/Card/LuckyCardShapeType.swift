//
//  CardShapeType.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

/**
 LuckyCardShapeType는 enum으로 선정했습니다.
 카드는 한개의 모양을 갖을 수 있고 여러 case 중 한개의 값을 선정할 수 있는 enum is the best라 생각했습니다.
 
 Notes:
 1. unicode는 LuckyCardShape의 Unicode 문자를 반환합니다.
 2. 모양의 description은 Emoji string이 반환됩니다.
 Unicode를 콘솔창에도 출력할 수 있는형태인 UnicodeScalar로 변환해야 합니다.
 */
enum LuckyCardShapeType: CardShapeEnumProtocol {
  typealias RawValue = String
  
  case dog
  case cat
  case cow
  
  init?(rawValue: String) {
    switch rawValue {
    case "cat":
      self = .cat
    case "cow":
      self = .cow
    case "dog":
      self = .dog
    default:
      self = .dog
    }
  }
  
  var rawValue: String {
    switch self {
    case .cat: return "cat"
    case .cow: return "cow"
    case .dog: return "dog"
    }
  }

  private var unicode: String {
    switch self {
    case .cat:
      return "U+1F431"
    case .dog:
      return "U+1F436"
    case .cow:
      return "U+1F42E"
    }
  }

  var description: String {
    self.unicode.toUnicodeTypeString()
  }
}
