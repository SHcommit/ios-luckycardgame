//
//  LuckyCardGameView+Constant.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import Foundation

extension LuckyCardGameView {
  struct Constant {
    static let spacing: UISpacing = {
      let topSpacing = UIConstant.shared.statusBarHeight + UIConstant.shared.spacing.top
      return UISpacing(top: topSpacing)
    }()
    
    enum Header {
      static let spacing: UISpacing = .init(
        leading: UIConstant.shared.spacing.leading,
        trailing: UIConstant.shared.spacing.trailing)
      static let size: CGSize = {
        let screenWidth = UIConstant.shared.screenSize.width
        return CGSize(width: screenWidth - Header.spacing.leading*2, height: 44)
      }()
    }
    
    enum ContentView {
      static let spacing: UISpacing = .init(
        leading: UIConstant.shared.spacing.leading,
        top: UIConstant.shared.spacing.top,
        trailing: UIConstant.shared.spacing.trailing)
    }
    
    enum Footer {
      static let spacing: UISpacing = .init(
        leading: UIConstant.shared.spacing.leading,
        top: UIConstant.shared.spacing.top,
        trailing: UIConstant.shared.spacing.trailing)
      
      /// 화면의 이미지를 보고 비율로 결정했습니다.
      /// 제가 캡쳐한 화면에서의 노란색, 짙은 회색 화면 비율이 70: 240이었습니다.
      ///  실제 노란색 height가 44이므로 짙은 회색은 151로 지정했습니다.
      static let height: CGFloat = 151
    }
  }
}
