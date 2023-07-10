//
//  CardShapeType.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

enum LuckyCardShapeType: CardShapeEnumProtocol {
  case dog
  case cat
  case cow
}

// MARK: - Computed Properties
extension LuckyCardShapeType {
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
}


// MARK: - CustomStringConvertible
extension LuckyCardShapeType {
  var description: String {
    self.unicode.toUnicodeTypeString()
  }
}
