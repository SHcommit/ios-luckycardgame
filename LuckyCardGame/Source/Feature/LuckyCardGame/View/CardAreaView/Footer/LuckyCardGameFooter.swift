//
//  LuckyCardGameFooter.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

final class LuckyCardGameFooter: BaseRoundView {
  // MARK: - Properties
  private var vm: LuckyCardGameFooterViewModel
  
  private var cardViews: [LuckyCardView]!
  
  private var cardSize: CGSize
  
  // MARK: - Lifecycle
  init(frame: CGRect, vm: LuckyCardGameFooterViewModel, cardSize: CGSize) {
    self.vm = vm
    self.cardSize = cardSize
    super.init(with: .footer, frame)
    setupUI()
  }
  
  // vmFIXME: - vm, cardSize 초기화 디폴트값, 동기화x
  required init?(coder: NSCoder) {
    vm = LuckyCardGameFooterViewModel(gameManager: .init(headCount: .three))
    cardSize = .zero
    super.init(coder: coder)
  }
}

extension LuckyCardGameFooter {
  func animDealCardViews() {
    _=cardViews.enumerated().map { n, cardView in
      let beforeY = bounds.height + cardView.bounds.height
      cardView.transform = CGAffineTransform(translationX: 0, y: beforeY)
      UIView.animate(
        withDuration: 0.3,
        delay: 0.1*Double(n),
        options: .curveEaseInOut
      ) {
        cardView.transform = .identity
        cardView.alpha = 1
      }
    }
  }
}

// MARK: - LayoutSupprot
extension LuckyCardGameFooter: LayoutSupport {
  func createSubviews() {
    initCards(with: makeCardViewsFrame())
  }
  
  func addSubviews() {
    _=cardViews.map { addSubview($0) }
  }
  
  func initCards(with cardFrameList: [CGRect]) {
    let cardsCnt = vm.gameManager.headCount.bottomCardsCountInBoard
    cardViews = (0..<cardsCnt).map {
      let viewModel = LuckyCardViewModel(
        gameManager: vm.gameManager,
        cardModel: vm.remainingDeck.cards[$0])
      
      return LuckyCardView(
        frame: cardFrameList[$0],
        viewModel: viewModel,
        cardAppearance: .rear
      ).set { $0.alpha = 0 }
    }
  }
}

// MARK: - LayoutSupport helper
private extension LuckyCardGameFooter {
  
  func interItemSpacing() -> UISpacing {
    let bottomCardsCountInOneHoriLinePlusOne = CGFloat(
      vm.gameManager
        .headCount
        .bottomCardsCountInOneHoriLine+1)
    let bottomCardsCntInOneHoriLine = CGFloat(
      vm.gameManager
        .headCount
        .bottomCardsCountInOneHoriLine)
    let totalCardWidth = cardSize.width*bottomCardsCntInOneHoriLine
    let leadingSpacing: CGFloat = (bounds
      .width - totalCardWidth) / bottomCardsCountInOneHoriLinePlusOne

    let bottomCardsCountInOneVertiLinePlusOne = CGFloat(
      vm.gameManager
        .headCount
        .bottomCardsCountInOneVertiLine+1)
    let bottomCardsCntInOneVertiLine = CGFloat(
      vm.gameManager
        .headCount
        .bottomCardsCountInOneVertiLine)
    let totalCardHeight = cardSize.height*bottomCardsCntInOneVertiLine
    let topSpacing: CGFloat = (bounds
      .height - totalCardHeight) / bottomCardsCountInOneVertiLinePlusOne
    return .init(
      leading: leadingSpacing,
      top: topSpacing)
  }
  
  func makeCardViewsFrame() -> [CGRect] {
    let headCount = vm.gameManager.headCount
    var interItemSpacing: UISpacing = interItemSpacing()
    var startX: CGFloat = interItemSpacing.leading
    var startY: CGFloat = interItemSpacing.top
    
    if headCount == .five {
      let leading = (bounds.width - cardSize.width*CGFloat(headCount.bottomCardsCountInBoard))/2
      interItemSpacing = .init(leading: leading, top: interItemSpacing.top)
    }
    
    return (0..<headCount.bottomCardsCountInBoard).map {
      let idx = CGFloat($0%headCount.bottomCardsCountInOneHoriLine)
      startX = idx * cardSize.width + interItemSpacing.leading*(idx+1)
      if headCount == .five && $0 > 0 {
        startX -= interItemSpacing.leading*(idx)
      }
      if $0 == headCount.bottomCardsCountInOneHoriLine {
        if headCount == .three || headCount == .four {
          startX = interItemSpacing.leading
          startY += interItemSpacing.top + cardSize.height
        }
      }
      return CGRect(
        x: startX,
        y: startY,
        width: cardSize.width,
        height: cardSize.height)
    }
  }
}
