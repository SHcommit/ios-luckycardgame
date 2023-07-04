//
//  UIConstant.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

struct UIConstant {
  static let shared = UIConstant.init()
  private init() {}
  
  var radius: CGFloat = 10
  
  var spacing: UISpacing = .init(
    leading: 20, top: 10, trailing: 20, bottom: 10)
  
  var statusBarHeight: CGFloat {
    var statusBarHeight: CGFloat = 0
    if #available(iOS 13.0, *) {
      let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
      statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
      statusBarHeight = UIApplication.shared.statusBarFrame.height
    }
    return statusBarHeight
  }
  
  var safeAreaLayoutGuideButtomHeight: CGFloat {
    guard
      let insets = UIApplication
        .shared
        .windows
        .first { $0.isKeyWindow }?
      .safeAreaInsets
    else { return 0 }
    return insets.bottom
  }
  
  var screenSize: CGSize {
    UIScreen.main.bounds.size
  }
}
