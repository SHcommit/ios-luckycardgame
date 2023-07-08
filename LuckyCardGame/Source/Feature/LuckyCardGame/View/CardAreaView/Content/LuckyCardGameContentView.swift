//
//  LuckyCardGameContentView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

final class LuckyCardGameContentView: BaseRoundView {
  // MARK: - Constant
  struct Constant {
    static let spacing: UISpacing = .init(
      top: UIConstant.shared.spacing.top)
    static let maximumHeadCount = 5
  }
  
  // MARK: - Properties
  private var playerHeadCount: PlayerHeadCountType!
  
  private var playerCardBoardViews: [PlayerCardBoardView]!
  
  // MARK: - Lifecycle
  init(frame: CGRect, playerHeadCount: PlayerHeadCountType) {
    super.init(with: .contentView, frame)
    self.playerHeadCount = playerHeadCount
    setupUI()
  }
  
  // playerHeadCountFIXME: - PlayerHeadCount 값을 변경해야합니다.
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    playerHeadCount = .none
    setupUI()
  }
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

// MARK: - LayoutSupport helper
extension LuckyCardGameContentView {
  func initBoardViews(y: inout CGFloat, height: CGFloat) {
    playerCardBoardViews = (0..<Constant.maximumHeadCount).map { i in
      if i > 0 { y += Constant.spacing.top + height }
      return PlayerCardBoardView(
        frame: .init(
          x: 0,
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
