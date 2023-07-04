//
//  BaseView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

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

