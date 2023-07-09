//
//  UIView+Constant.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/06.
//

import UIKit

extension UIView {
  struct Constnat {
    static var statusBarHeight: CGFloat {
      var statusBarHeight: CGFloat = 0
      if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
      } else {
        statusBarHeight = UIApplication.shared.statusBarFrame.height
      }
      return statusBarHeight
    }
    
    static var safeAreaLayoutGuideButtomHeight: CGFloat {
      guard
        let insets = UIApplication
          .shared
          .windows
          .first { $0.isKeyWindow }?
        .safeAreaInsets
      else { return 0 }
      if UIScreen.main.bounds.size.width == 375 && UIScreen.main.bounds.size.height == 667 {
        return insets.bottom + 10
      }
      return insets.bottom
    }
  }
}
