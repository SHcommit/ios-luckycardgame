//
//  LuckyCardGamePlayerBoardView+Constant.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

extension PlayerGameBoardView {
  struct Constant {
    static let bgColor: UIColor = .lightGray.withAlphaComponent(0.5)
    static let radius: CGFloat = UIConstant.shared.radius
    
    enum AlphabetLabel {
      static let textColor: UIColor = .gray.withAlphaComponent(0.5)
      static let textSize: CGFloat = 40
      static let spacing: UISpacing = .init(leading: 15)
    }
  }
}
