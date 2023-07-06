//
//  String+ToUnicodeTypeString.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

import Foundation

extension String {
  func toUnicodeTypeString() -> String{
    let suffix = replacingOccurrences(of: "U+", with: "")
    guard
      let suffixInt = UInt32(suffix, radix: 16),
      let unicodeScalar = UnicodeScalar(suffixInt)
    else {
      return ""
    }
    return String(unicodeScalar)
  }
}
