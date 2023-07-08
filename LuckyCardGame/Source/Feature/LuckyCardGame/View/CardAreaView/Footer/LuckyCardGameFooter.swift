//
//  LuckyCardGameFooter.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

final class LuckyCardGameFooter: BaseView {
  // MARK: - Constant
  struct Constant {
    static let radius: CGFloat = BaseView.Constant.radius
    static let bgColor: UIColor = BaseViewPalette.footer.bgColor
  }
  
  // MARK: - Lifecycle
  init(frame: CGRect) {
    super.init(with: .footer, frame)
    backgroundColor = Constant.bgColor
    layer.cornerRadius = Constant.radius
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    backgroundColor = Constant.bgColor
    layer.cornerRadius = Constant.radius
  }
}
