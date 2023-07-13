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
  private var playerCardBoardViews: [PlayerCardBoardView]!
  
  private var gameManager :LuckyCardGameManager
  
  // MARK: - Lifecycle
  init(
    frame: CGRect,
    gameManager: LuckyCardGameManager
  ) {
    self.gameManager = gameManager
    super.init(with: .contentView, frame)
    setupUI()
  }
  
  // gameManagerFIXME: - gameManager를 상위 객체로부터 상속받아야 합니다.
  required init?(coder: NSCoder) {
    self.gameManager = .init(headCount: .five)
    super.init(coder: coder)
    setupUI()
  }
}

// MARK: - Helper
extension LuckyCardGameContentView {
  func animDealCardViewsInEachPalyerBoard() {
    _=playerCardBoardViews.map {
      $0.animDealCardViews()
    }
  }
}

// MARK: - LayoutSupport
extension LuckyCardGameContentView: LayoutSupport {
  func createSubviews() {
    let playerGameBoardHeight = (bounds.height - Constant.spacing.top*4)/CGFloat(Constant.maximumHeadCount)
    let defaultY: CGFloat = bounds.origin.y
    var y: CGFloat = defaultY
    initBoardViews(y: &y, height: playerGameBoardHeight)
  }
  
  func addSubviews() {
    addBorderViewsFromSuperView()
  }
}

// MARK: - LayoutSupport helper
extension LuckyCardGameContentView {
  func initBoardViews(y: inout CGFloat, height: CGFloat) {
    let playerBoardTypes :[PlayerBoardType] = [.A, .B, .C, .D, .E]
    playerCardBoardViews = (0..<gameManager.headCount.toInt).map { i in
      if i > 0 { y += Constant.spacing.top + height }
      let rect: CGRect = .init(x: 0, y: y, width: bounds.width, height: height)
      let vm = PlayerCardBoardViewModel(
        boardType: playerBoardTypes[i],
        gameManager: gameManager)
      return PlayerCardBoardView(
        frame: rect,
        vm: vm)
    }
  }
  
  func addBorderViewsFromSuperView() {
    _=(0..<gameManager.headCount.toInt).map {
      addSubview(playerCardBoardViews[$0])
    }
  }
  
  func cardSize() -> CGSize {
    return PlayerCardBoardView.Constant.intrinsicCardSize(from: playerCardBoardViews[0])
  }
}
