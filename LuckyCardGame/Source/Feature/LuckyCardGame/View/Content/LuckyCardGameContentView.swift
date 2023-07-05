//
//  LuckyCardGameContentView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

/// 플레이어들의 카드를 담당하는 view 입니다.
///
/// - Param maximumHeadCount : 가능한 플레이어 인원 수
/// - Param playerHeadCount : 3 or 4 or 5. 추후 재사용 하기 위해 enum타입으로 정의했습니다.
///   이에 따라 boardViews가 초기화 됩니다.
/// - Param playerCardBoardViews : 각각의 플레이어가 가진 카드들의 보드판에 대한 view입니다.
///   playerHeadCount에 따라 게임 제약 조건이 적용된 화면에 보드 판이 보여집니다.
/// - Param isInitBoardViews : playerCardBoardViews가 초기화 되지 않았을 경우를 확인하는 computed property
///
/// **Notes:**
/// 1. LuckyCardGameContentView는 layout으로 지정되었습니다. 그렇지만 결국엔 frame이 지정되기 때문에 그 시점의 bounds와 frame을 이용했습니다.
/// 2. playerHeadCount에 따라 playerCardBoardViews가 초기화 됩니다. 사용자가 3명, 4명, 5명인 경우에 따라 즉시 즉시 초기화 됩니다.
///
/// Examples:
/// ```
/// let contentView = LuckyCardGameContentView()
/// if !contentView.isInitBoardViews {
///   contentView.configure(with: .five)
///   // .three or .four or .five 중 택
/// }
///
/// ```
///
final class LuckyCardGameContentView: BaseView {
  // MARK: - Constant
  private let maximumHeadCount = 5
  
  // MARK: - Properties
  private var playerHeadCount: PlayerHeadCountType!
  
  private var playerCardBoardViews: [PlayerCardBoardView]!
  
  var isInitBoardViews: Bool {
    playerCardBoardViews == nil ? false : true
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
    if playerCardBoardViews == nil {
      let playerGameBoardHeight = (bounds.height - Constant.spacing.top*4)/CGFloat(maximumHeadCount)
      let defaultY: CGFloat = bounds.origin.y
      var y: CGFloat = defaultY
      setBordeViewsFrame(y: &y, height: playerGameBoardHeight)
      addBorderViewsFromSuperView()
      let playerBoardTypes :[PlayerBoardType] = [.A, .B, .C, .D, .E]
      for (idx, type) in playerBoardTypes.enumerated() {
        playerCardBoardViews[idx].configure(with: type)
      }
    }
  }
  
  func setBordeViewsFrame(y: inout CGFloat, height: CGFloat) {
    playerCardBoardViews = (0..<maximumHeadCount).map { i in
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
