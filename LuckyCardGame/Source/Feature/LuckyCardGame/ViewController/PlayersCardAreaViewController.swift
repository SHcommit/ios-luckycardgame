//
//  PlayersCardAreaViewController.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/08.
//

import UIKit

final class PlayersCardAreaViewController: UIViewController {
  // MARK: - Constant
  struct Constant {
    enum playersCardBoardAreaView {
      static func relationalHeight(from targetHeight: CGFloat) -> CGFloat {
        return targetHeight - FooterCardBoardView.height
      }
    }
    
    enum FooterCardBoardView {
      static let height: CGFloat = 151
      static let spacing: UISpacing = .init(
        leading: UIConstant.shared.spacing.top)
    }
  }
  
  // MARK: - Properties
  private var playerHeadCountType: PlayerHeadCountType?
  
  private var playersCardBoardAreaView: LuckyCardGameContentView!
  
  private var footerCardBoardView: LuckyCardGameFooter!
  
  // MARK: - Lifecycles
  private override init(
    nibName nibNameOrNil: String?,
    bundle nibBundleOrNil: Bundle?
  ) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  init(
    nibName nibNameOrNil: String?,
    bundle nibBundleOrNil: Bundle?,
    playerHeadCountType: PlayerHeadCountType
  ) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    self.playerHeadCountType = playerHeadCountType
  }
  
  convenience init(playerHeadCountType: PlayerHeadCountType) {
    self.init(nibName: nil, bundle: nil, playerHeadCountType: playerHeadCountType)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
}

// MARK: - LayoutSupport
extension PlayersCardAreaViewController: LayoutSupport {
  func createSubviews() {
    playersCardBoardAreaView = .init(
      frame: playersCardBoardAreaViewFrame,
      playerHeadCount: playerHeadCountType ?? .three)
    footerCardBoardView = .init(
      frame: footerCardBoardViewFrame)
  }
  
  func addSubviews() {
    _=[playersCardBoardAreaView, footerCardBoardView].map { view.addSubview($0) }
  }
}

// MARK: - LayoutSupport helpers
extension PlayersCardAreaViewController {
  fileprivate var playersCardBoardAreaViewHeight: CGFloat {
    Constant
      .playersCardBoardAreaView
      .relationalHeight(
        from: view.bounds.height)
  }
  
  private var playersCardBoardAreaViewFrame: CGRect {
    let viewHeight = view.bounds.height
    let footerHeight = Constant.FooterCardBoardView.height
    let playerCardBoardTopSpacing = LuckyCardGameContentView
      .Constant
      .spacing
      .top
    
    return .init(
      x: 0,
      y: 0,
      width: view.bounds.width,
      height: viewHeight - footerHeight - playerCardBoardTopSpacing)
  }
  
  private var footerCardBoardViewFrame: CGRect {
    let playerCount = CGFloat(PlayerHeadCountType.count - 1)
    let playersCardBoardInterItemSpacing = LuckyCardGameContentView
      .Constant
      .spacing
      .top
    let playerCardBoardHeightWithoutSpacing = playersCardBoardAreaViewHeight - (playerCount*playersCardBoardInterItemSpacing)
    let playerCardBoardHeight = playerCardBoardHeightWithoutSpacing/(playerCount-1)
    
    let footerCardBoardHeight = playerHeadCountType == .five ? Constant
      .FooterCardBoardView
      .height : Constant.FooterCardBoardView.height + playerCardBoardHeight
    
    return .init(
      x: 0,
      y: view.bounds.height - footerCardBoardHeight,
      width: view.bounds.width,
      height: footerCardBoardHeight)
  }
}
