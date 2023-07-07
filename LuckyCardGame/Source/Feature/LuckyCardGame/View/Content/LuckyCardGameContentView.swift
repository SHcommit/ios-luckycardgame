//
//  LuckyCardGameContentView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

final class LuckyCardGameContentView: BaseView {
  // MARK: - Constant
  struct Constant {
    static let spacing: UISpacing = .init(
      top: UIConstant.shared.spacing.top)
    static let maximumHeadCount = 5
  }
  
  // MARK: - Properties
  private var playerHeadCount: PlayerHeadCountType!
  
  private var playerCardBoardViews: [PlayerCardBoardView]!
  
  var isInitBoardViews: Bool {
    playerCardBoardViews == nil ? false : true
  }
  
  // MARK: - Lifecycle
  init(frame: CGRect, playerHeadCount: PlayerHeadCountType) {
    super.init(with: .contentView, frame)
    self.playerHeadCount = playerHeadCount
    setupUI()
  }
  
  required init?(coder: NSCoder) { fatalError() }
}

// MARK: - Private helper
extension LuckyCardGameContentView: LayoutSupport {
  func createSubviews() {
    let playerGameBoardHeight = (bounds.height - Constant.spacing.top*4)/CGFloat(Constant.maximumHeadCount)
    let defaultY: CGFloat = bounds.origin.y
    var y: CGFloat = defaultY
    initBoardViews(y: &y, height: playerGameBoardHeight)
  }
  
  func addSubviews() {
    addBorderViewsFromSuperView()
    let playerBoardTypes :[PlayerBoardType] = [.A, .B, .C, .D, .E]
    for (idx, type) in playerBoardTypes.enumerated() {
      playerCardBoardViews[idx].configure(with: type)
    }
  }
}

// MARK: - LayoutSupport helpers
extension LuckyCardGameContentView {
  func initBoardViews(y: inout CGFloat, height: CGFloat) {
    playerCardBoardViews = (0..<Constant.maximumHeadCount).map { i in
      if i > 0 { y += Constant.spacing.top + height }
      return PlayerCardBoardView(
        frame: .init(
          x: Constant.spacing.leading,
          y: y,
          width: bounds.width,
          height: height))
    }
  }
  
  func addBorderViewsFromSuperView() {
    _=(0..<playerHeadCount.toInt).map {
      addSubview(playerCardBoardViews[$0])
    }
  }
}
