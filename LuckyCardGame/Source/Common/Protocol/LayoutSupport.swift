//
//  LayoutSupport.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

/// UIView's layout support
protocol LayoutSupport {
  
  /// Add subviews in root view
  func addSubviews()
  
  /// Set subviews constraints in root view
  func setConstraints()
}

extension LayoutSupport {
  func setupUI() {
    addSubviews()
    setConstraints()
  }
}
