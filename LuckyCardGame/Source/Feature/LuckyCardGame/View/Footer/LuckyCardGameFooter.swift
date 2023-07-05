//
//  LuckyCardGameFooter.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

final class LuckyCardGameFooter: BaseView {
  // MARK: - Properties
  
  // MARK: - Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = Constant.bgColor
    layer.cornerRadius = Constant.radius
  }
  
  required init?(coder: NSCoder) { fatalError() }
}
