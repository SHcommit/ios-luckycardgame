//
//  LuckyCardGameContentView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

final class LuckyCardGameContentView: BaseView {
  // MARK: - Constant
  private let maximumHeadCount = 5
  
  // MARK: - Properties
  private var playerHeadCount: PlayerHeadCountType!
  
  private var boardViews: [PlayerGameBoardView]!
  
  var isInitBoardViews: Bool {
    boardViews == nil ? false : true
  }
  
  // MARK: - Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) { fatalError() }
}

// MARK: - Helper
extension LuckyCardGameContentView {
  func configure(with playerHeadCount: PlayerHeadCountType) {
    self.playerHeadCount = playerHeadCount
    initBoardViews()
  }
}

// MARK: - Private helper
private extension LuckyCardGameContentView {
  func initBoardViews() {
    if boardViews == nil {
      let playerGameBoardHeight = (bounds.height - Constant.spacing.top*4)/CGFloat(maximumHeadCount)
      let defaultY: CGFloat = bounds.origin.y
      var y: CGFloat = defaultY
      setBordeViewsFrame(y: &y, height: playerGameBoardHeight)
      addBorderViewsFromSuperView()
      let playerBoardTypes :[PlayerBoardType] = [.A, .B, .C, .D, .E]
      for (idx, type) in playerBoardTypes.enumerated() {
        boardViews[idx].configure(with: type)
      }
    }
  }
  
  func setBordeViewsFrame(y: inout CGFloat, height: CGFloat) {
    boardViews = (0..<maximumHeadCount).map { i in
      if i > 0 { y += Constant.spacing.top + height }
      return PlayerGameBoardView(
        frame: .init(
          x: Constant.spacing.leading,
          y: y,
          width: bounds.width,
          height: height))
    }
  }
  
  func addBorderViewsFromSuperView() {
    _=(0..<playerHeadCount.toInt).map {
      addSubview(boardViews[$0])
    }
  }
}
