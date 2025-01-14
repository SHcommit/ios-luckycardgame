//
//  LuckyCardDeckError.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

import Foundation

enum LuckyCardDeckError: Error {
  case OutOfRange
}

// MARK: - Error Descriptions
extension LuckyCardDeckError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .OutOfRange: return "The index is outside the valid range of the deck"
    }
  }
}
