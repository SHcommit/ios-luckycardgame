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
        return targetHeight - FooterCardBoardView.height - FooterCardBoardView.spacing.top
      }
    }
    
    enum FooterCardBoardView {
      static let height: CGFloat = 151
      static let spacing: UISpacing = .init(
        top: UIConstant.shared.spacing.top)
    }
  }
  
  // MARK: - Properties
  private var playerHeadCountType: PlayerHeadCountType?
  
  private var playersCardBoardAreaView: LuckyCardGameContentView!
  
  private var footerCardBoardView: LuckyCardGameFooter!
  
  private var parentViewBounds: CGRect?
  
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
    playerHeadCountType: PlayerHeadCountType,
    viewFrame: CGRect
  ) {
    // MARK: - 주의. init시점에 view.frame = viewFrame을 하면안됨
    // 이유: 아직 vc의 view가 초기화되지 않을 수도 있다고 한다....
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    self.playerHeadCountType = playerHeadCountType
    parentViewBounds = viewFrame
  }
  
  convenience init(playerHeadCountType: PlayerHeadCountType, viewFrame: CGRect) {
    self.init(nibName: nil, bundle: nil, playerHeadCountType: playerHeadCountType, viewFrame: viewFrame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  // 이 시점에 view는 초기화 되고, view에 대한 frame을 지정 후 하면 된다.
  // 그 이전 시점 vc's init시점은 view가 초기화 되지 않을 가능성이 있다.
  override func loadView() {
    super.loadView()
    view.frame = parentViewBounds ?? .zero
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
    _=[playersCardBoardAreaView,
       footerCardBoardView]
      .map { view.addSubview($0) }
  }
}

// MARK: - LayoutSupport helper
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
    return .init(
      x: 0,
      y: 0,
      width: view.bounds.width,
      height: viewHeight - footerHeight - Constant.FooterCardBoardView.spacing.top)
  }
  
  private var footerCardBoardViewFrame: CGRect {
    let playerMaxHeadCount = CGFloat(PlayerHeadCountType.maximumHeadCountToInt)
    let playersCardBoardVerticalInterItemSpacing = LuckyCardGameContentView
      .Constant
      .spacing
      .top
    let playerInterItemSpacingCount = playerMaxHeadCount - 1
    let playersCardboardVerticalTotalInterItemSpacing = playerInterItemSpacingCount * playersCardBoardVerticalInterItemSpacing
    let playerCardBoardHeightWithoutSpacing = playersCardBoardAreaViewHeight - playersCardboardVerticalTotalInterItemSpacing
    let aPlayerCardBoardHeight = playerCardBoardHeightWithoutSpacing / playerMaxHeadCount
    let footerCardBoardHeight = playerHeadCountType == .five ? Constant
      .FooterCardBoardView
      .height : Constant.FooterCardBoardView.height + aPlayerCardBoardHeight
    
    return .init(
      x: 0,
      y: view.bounds.height - footerCardBoardHeight ,
      width: view.bounds.width,
      height: footerCardBoardHeight)
  }
}
