//
//  UIConstant.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

/// LuckyCardGame 관련 뷰에서 사용되는 공통적인 Constant 입니다.
struct UIConstant {
  static let shared = UIConstant.init()
  private init() {}
  
  var spacing: UISpacing = .init(
    leading: 20, top: 10, trailing: 20, bottom: 10)
  
  var screenSize: CGSize {
    UIScreen.main.bounds.size
  }
}
