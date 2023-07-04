//
//  BaseView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

/// UIView를 커스텀할 때 중복되는 코드 제거를 위한 BaseView 입니다.
class BaseView: UIView, LayoutSupport {
  // MARK: - Properties
  
  // MARK: - Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    setupUI()
  }
  
  required init?(coder: NSCoder) { fatalError() }

  // MARK: - LayoutSupport
  func addSubviews() { }
  func setConstraints() { }
}

