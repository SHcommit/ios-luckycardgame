//
//  BaseView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

/// UIView를 커스텀할 때 중복되는 코드 제거를 위한 BaseView 입니다.
class BaseView: UIView {
  // MARK: - Constnat
  struct Constant {
    static let radius: CGFloat = 10
  }
  
  // MARK: - Lifecycle
  private override init(frame: CGRect) {
    super.init(frame: frame)
    layer.cornerRadius = Constant.radius
  }
  
  init(with childViewCase: BaseViewPalette, _ frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = childViewCase.bgColor
    let autoLayoutList: [BaseViewPalette] = [
      .LuckyCardGameView,
      .header,
      .contentView,
      .footer]
    if autoLayoutList.contains(childViewCase) {
      translatesAutoresizingMaskIntoConstraints = false
    }
    layer.cornerRadius = Constant.radius
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}

