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
      static let height: CGFloat = {
        let headerPlusTopSpacing = Header.size.height + Header.spacing.top
        let footerPlusSafeAreaLayoutGuideBottomHeight = Footer.height + UIConstant
          .shared
          .safeAreaLayoutGuideButtomHeight
        let contentViewTopAndBottomSpacing = UIConstant
          .shared.spacing.top + UIConstant
          .shared.spacing.bottom
        
        let screenHeight = UIConstant.shared.screenSize.height
        return screenHeight - (
          headerPlusTopSpacing +
          footerPlusSafeAreaLayoutGuideBottomHeight +
          contentViewTopAndBottomSpacing)
      }()
      
      static let width: CGFloat = {
        return UIConstant.shared.screenSize.width - spacing.leading*2
      }()
    }
    
    enum Footer {
      static let spacing: UISpacing = .init(
        leading: UIConstant.shared.spacing.leading,
        top: UIConstant.shared.spacing.top,
        trailing: UIConstant.shared.spacing.trailing)
      // 이미지 보고 비율로 결정. 노란색: 짙은회색 비율이 캡쳐화면속에선 70: 240이었는데 실제로 노란색이 44.
      static let height: CGFloat = 151
    }
  }
}
