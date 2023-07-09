//
//  LuckyCardGameFooter.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

final class LuckyCardGameFooter: BaseRoundView {
  // MARK: - Constant
  struct Constant {
    static let radius: CGFloat = BaseRoundView.Constant.radius
    static let bgColor: UIColor = BaseViewPalette.footer.bgColor
  }
  
  // MARK: - Properties
  private var gameManager: LuckyCardManager!
  
  // MARK: - Lifecycle
  init(frame: CGRect, gameManager: LuckyCardManager) {
    super.init(with: .footer, frame)
    self.gameManager = gameManager
    backgroundColor = Constant.bgColor
    layer.cornerRadius = Constant.radius
  }
  
  // gameManagerFIXME: - gmaeManager 초기화 x
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    gameManager = nil
    backgroundColor = Constant.bgColor
    layer.cornerRadius = Constant.radius
  }
}
