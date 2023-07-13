//
//  LuckyCardGameView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

final class LuckyCardGameView: BaseRoundView {
  // MARK: - Constant
  struct Constant {
    enum Header {
      static let size: CGSize = {
        let intrinsicWidth = UIConstant.shared.screenSize.width
        return CGSize(width: intrinsicWidth, height: 44)
      }()
    }
    
    enum CardAreaPageView {
      static let spacing: UISpacing = .init(
        leading: UIConstant.shared.spacing.leading,
        top: UIConstant.shared.spacing.top)
    }
  }

  // MARK: - Properties
  private var header: LuckyCardGameHeader!
  
  private var playersCardAreaViewControllers: [PlayersCardAreaViewController]!
  
  private lazy var cardAreaPageViewController = UIPageViewController(
    transitionStyle: .scroll,
    navigationOrientation: .horizontal
  ).set {
    $0.setViewControllers(
      [playersCardAreaViewControllers[0]],
      direction: .forward,
      animated: true)
    $0.view.frame = cardAreaPageViewFrame
  }
  
  private var pageVCPresntingIdx = 0
  
  // MARK: - Lifecycle
  init(frame: CGRect) {
    super.init(with: .LuckyCardGameView, frame)
    isUserInteractionEnabled = true
    setupUI()
    
    let viewModels: [PlayersCardboardAreaViewModel] = [
      .init(gameManager: .init(headCount: .three)),
      PlayersCardboardAreaViewModel(
        gameManager: .init(headCount: .four)),
      PlayersCardboardAreaViewModel(
        gameManager: .init(headCount: .five))]
    
    playersCardAreaViewControllers = [
      .init(
        viewFrame: cardAreaPageViewFrame,
        vm: viewModels[0]),
      .init(
        viewFrame: cardAreaPageViewFrame,
        vm: viewModels[1]),
      .init(
        viewFrame: cardAreaPageViewFrame,
        vm: viewModels[2])]
    addSubview(cardAreaPageViewController.view)
    bind()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    isUserInteractionEnabled = true
    setupUI()
    let viewModels: [PlayersCardboardAreaViewModel] = [
      PlayersCardboardAreaViewModel(
        gameManager: .init(headCount: .three)),
      PlayersCardboardAreaViewModel(
        gameManager: .init(headCount: .four)),
      PlayersCardboardAreaViewModel(
        gameManager: .init(headCount: .five))]
    
    playersCardAreaViewControllers = [
      .init(
        viewFrame: cardAreaPageViewFrame,
        vm: viewModels[0]),
      .init(
        viewFrame: cardAreaPageViewFrame,
        vm: viewModels[1]),
      .init(
        viewFrame: cardAreaPageViewFrame,
        vm: viewModels[2])]
    addSubview(cardAreaPageViewController.view)
    bind()
  }
  
  deinit {
    cardAreaPageViewController.setViewControllers(
      nil,
      direction: .forward,
      animated: false)
    
    NotificationCenter.default.removeObserver(
      self,
      name: .playerHeadCountMenuDidChange,
      object: nil)
  }
}

// MARK: - Private helper
private extension LuckyCardGameView {
  func bind() {
    bindIfPlayerHeadCountMenuDidChanged()
  }
  
  func bindIfPlayerHeadCountMenuDidChanged() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(handleMenuChange),
      name: .playerHeadCountMenuDidChange,
      object: nil)
  }

  func gotoNextPage() {
    cardAreaPageViewController.setViewControllers(
      [playersCardAreaViewControllers[pageVCPresntingIdx]],
      direction: .forward,
      animated: true)
  }
  
  func gotoPrevPage() {
    cardAreaPageViewController.setViewControllers(
      [playersCardAreaViewControllers[pageVCPresntingIdx]],
      direction: .reverse,
      animated: true)
  }
}

// MARK: - Action
extension LuckyCardGameView {
  @objc func handleMenuChange(_ notification: Notification) {
    guard
      let selectedOption = notification
        .userInfo?[PlayerHeadCountType.notificationUserInfoKey] as? PlayerHeadCountType
    else {
      return
    }
    let selectedIdx = selectedOption.toCaseIterableIdx
    if pageVCPresntingIdx > selectedIdx && (0..<PlayerHeadCountType.caseCount).contains(selectedIdx) {
      pageVCPresntingIdx = selectedIdx
      gotoPrevPage()
    } else if (0..<PlayerHeadCountType.caseCount).contains(selectedIdx) {
      pageVCPresntingIdx = selectedIdx
      gotoNextPage()
    }
  }
}

// MARK: - LayoutSupport
extension LuckyCardGameView: LayoutSupport {
  func createSubviews() {
    header = .init(frame: headerFrame)
  }
  
  func addSubviews() {
    addSubview(header)
  }
}

// MARK: - LayoutSupport helpers
extension LuckyCardGameView {
  private var headerFrame: CGRect {
    .init(
      x: 0,
      y: 0,
      width: bounds.width,
      height: Constant.Header.size.height)
  }
  
  private var cardAreaPageViewFrame: CGRect {
    let headerHeight = Constant.Header.size.height
    let topSpacing = Constant.CardAreaPageView.spacing.top
    
    return .init(
      x: 0,
      y: headerHeight+topSpacing,
      width: bounds.width,
      height: bounds.height - headerHeight - topSpacing)
  }
}
