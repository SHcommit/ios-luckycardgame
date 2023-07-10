//
//  PlayerCardBoardView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

final class PlayerCardBoardView: BaseRoundView {
  // MARK: - Constant
  struct Constant {
    static let topSpacing: CGFloat = 7
    static func cardContentWidthWithoutHoriSpacing(
      from superView: UIView, edgeSpacing: UISpacing
    ) -> CGFloat {
      return superView.bounds
        .width - (edgeSpacing
          .leading + edgeSpacing.trailing)
    }
    
    // 기준은 사용자 5명일 때 각각의 카드에 대한 interitem spacing = 0을 기준으로 했습니다.
    // 첫 카드와 보드 edge간 leading spacing = 12 , top spacing = 7
    static func intrinsicCardSize(from superView: UIView) -> CGSize {
      let cardContentWidthWithoutHoriSpacing = cardContentWidthWithoutHoriSpacing(
        from: superView,
        edgeSpacing: HeadCountIsFive.edgeSpacing)
      
      let intrinsicCardHeight = superView.bounds
        .height - (topSpacing*2)
      
      let intrinsicCardWidth = cardContentWidthWithoutHoriSpacing / CGFloat(
        PlayerHeadCountType.five.playerCardsCountInBoard)
      
      return .init(
        width: intrinsicCardWidth,
        height: intrinsicCardHeight)
    }
    
    static func interItemSpacing(
      from superView: UIView,
      edgeSpacing: UISpacing,
      headCount: PlayerHeadCountType
    ) -> UISpacing {
      let cardSize = intrinsicCardSize(from: superView)
      let boardWidthWithoutSpacing = cardContentWidthWithoutHoriSpacing(
        from: superView,
        edgeSpacing: edgeSpacing)
      let playerOwnCardsCount = CGFloat(headCount
        .playerCardsCountInBoard)
      let totalWidthCardSize = cardSize.width * playerOwnCardsCount
      
      let leftSpacing: CGFloat = (totalWidthCardSize - boardWidthWithoutSpacing) / (playerOwnCardsCount - 1)
      return .init(leading: leftSpacing)
    }
    
    enum HeadCountIsThree {
      static let edgeSpacing: UISpacing = .init(
        leading: 7, top:7, trailing: 7, bottom: 7)
      static func interItemSpacing(from superView: UIView) -> UISpacing {
        return Constant.interItemSpacing(
          from: superView,
          edgeSpacing: edgeSpacing,
          headCount: .three)
      }
    }
    
    enum HeadCountIsFour {
      static let edgeSpacing: UISpacing = .init(
        leading: 12, top: 7, trailing: 12, bottom: 7)
      static func interItemSpacing(from superView: UIView) -> UISpacing {
        return Constant.interItemSpacing(
          from: superView,
          edgeSpacing: edgeSpacing,
          headCount: .four)
      }
      
    }
    
    enum HeadCountIsFive {
      static let edgeSpacing: UISpacing = .init(
        leading: 12, top: 7, trailing: 12, bottom: 7)
      static let spacing: UISpacing = .init()
    }
  }
  
  // MARK: - Properties
  private var cardViews: [LuckyCardView]!
  
  private var vm: PlayerCardBoardViewModel
  
  // MARK: - Lifecycle
  init(
    frame: CGRect,
    vm: PlayerCardBoardViewModel
  ) {
    self.vm = vm
    super.init(with: .playerCardBoardView, frame)
    setupUI()
  }
  
  // vm, boardTypeFIXME: - vm, boardType를 추가 구현해야 합니다. 디퐅트 값 넣음.
  required init?(coder: NSCoder) {
    vm = .init(
      boardType: .A,
      gameManager: .init(headCount: .five))
    super.init(coder: coder)
    setupUI()
  }
}

// MARK: - Helper
extension PlayerCardBoardView {
  func animDealCardViews() {
    _=cardViews.enumerated()
      .map { idx, cardView in
        cardView.alpha = 0.0
        cardView.transform = CGAffineTransform(
          translationX: bounds.width, y: 0)
    
        UIView.animate(
          withDuration: 0.1,
          delay: 0.1 * Double(idx),
          options: .curveEaseInOut
        ) {
          cardView.transform = .identity
          cardView.alpha = 1
      }
    }
  }
}

// MARK: - Private helper
private extension PlayerCardBoardView {
  func initCards(with cardsFrameList: [CGRect]) {
    let cardsCount = vm.gameManager.headCount.playerCardsCountInBoard
    guard vm.boardType == .A else {
      // other
      cardViews = (0..<cardsCount).map {
        let viewModel = LuckyCardViewModel(
          gameManager: vm.gameManager,
          cardModel: vm.showPlayerCard($0))
        return LuckyCardView(
          frame: cardsFrameList[$0],
          viewModel: viewModel,
          cardAppearance: .rear)
      }
      return
    }
    // me
    cardViews = (0..<cardsCount).map {
      let viewModel = LuckyCardViewModel(
        gameManager: vm.gameManager,
        cardModel: vm.showPlayerCard($0))
      return LuckyCardView(
        frame: cardsFrameList[$0],
        viewModel: viewModel,
        cardAppearance: .front)
    }
  }
}

// MARK: - LayoutSupport
extension PlayerCardBoardView: LayoutSupport {
  func createSubviews() {
    initCards(with: makeCardViewsFrame())
  }
  
  func addSubviews() {
    _=cardViews.map{ addSubview($0) }
  }
}

// MARK: - LayoutSupport helper
private extension PlayerCardBoardView {
  func makeCardViewsFrame() -> [CGRect] {
    let headCount = vm.gameManager.headCount
    let cardSize = Constant.intrinsicCardSize(from: self)
    var startX: CGFloat = 0
    var interItemSpacing: UISpacing = .init()
    
    switch headCount {
    case .three:
      startX = Constant.HeadCountIsThree.edgeSpacing.leading
      interItemSpacing = Constant.interItemSpacing(
        from: self,
        edgeSpacing: Constant.HeadCountIsThree.edgeSpacing,
        headCount: headCount)
    case .four:
      startX = Constant.HeadCountIsFour.edgeSpacing.leading
      interItemSpacing = Constant.interItemSpacing(
        from: self,
        edgeSpacing: Constant.HeadCountIsFour.edgeSpacing,
        headCount: headCount)
    case .five:
      startX = Constant.HeadCountIsFive.edgeSpacing.leading
      interItemSpacing = Constant.interItemSpacing(
        from: self,
        edgeSpacing: Constant.HeadCountIsFive.edgeSpacing,
        headCount: headCount)
    }
    
    return (0..<headCount.playerCardsCountInBoard).map {
      var x = CGFloat($0)*cardSize.width + startX
      if $0 > 0 {
        x -= interItemSpacing.leading*CGFloat($0)
      }
      return CGRect(
        origin: .init(x: x, y: Constant.topSpacing),
        size: cardSize)
    }
  }
}
