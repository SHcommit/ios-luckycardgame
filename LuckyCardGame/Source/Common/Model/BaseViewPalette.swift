//
//  BaseViewPalette.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

import UIKit

enum BaseViewPalette {
  case header
  
  //ContentView -> playerCardBoardViews -> cardViews
  case contentView
  case playerCardBoardView
  case cardView
  
  case footer
}

// MARK: - Helpers
extension BaseViewPalette {
  var bgColor: UIColor {
    switch self {
    case .header:
      return .yellow.withAlphaComponent(0.85)
    case .contentView:
      return .white
    case .playerCardBoardView:
      return .lightGray.withAlphaComponent(0.5)
    case .cardView:
      return .white
    case .footer:
      return .gray
    }
  }
}
