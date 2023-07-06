//
//  BaseView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

/// UIView를 커스텀할 때 중복되는 코드 제거를 위한 BaseView 입니다.
class BaseView: UIView, LayoutSupport {
  // MARK: - Constnat
  struct Constant {
    static let radius: CGFloat = 10
//    static let spacing: UISpacing = .init(
//      leading: 20, top: 10, trailing: 20, bottom: 10)
  }
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

