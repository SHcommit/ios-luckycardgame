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
        edgeSpacing: HeadCount.IsFive.edgeSpacing)
      let intrinsicCardHeight = superView.bounds.height - (topSpacing*2)
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
    
    enum HeadCount {
      enum IsThree {
        static let edgeSpacing: UISpacing = .init(
          leading: 7, top:7, trailing: 7, bottom: 7)
        
        static func interItemSpacing(from superView: UIView) -> UISpacing {
          return Constant.interItemSpacing(
            from: superView,
            edgeSpacing: edgeSpacing,
            headCount: .three)
        }
      }
      
      enum IsFour {
        static let edgeSpacing: UISpacing = .init(
          leading: 12, top: 7, trailing: 12, bottom: 7)
        
        static func interItemSpacing(from superView: UIView) -> UISpacing {
          return Constant.interItemSpacing(
            from: superView,
            edgeSpacing: edgeSpacing,
            headCount: .four)
        }
      }
      
      enum IsFive {
        static let edgeSpacing: UISpacing = .init(
          leading: 12, top: 7, trailing: 12, bottom: 7)
        
        static let spacing: UISpacing = .init()
      }
    }
  }
  
  // MARK: - Properties
  private var cardViews: [LuckyCardView]!
  
  private var vm: PlayerCardBoardViewModelProtocol!
  
  // MARK: - Lifecycle
  init(
    frame: CGRect,
    vm: PlayerCardBoardViewModelProtocol
  ) {
    self.vm = vm
    super.init(with: .playerCardBoardView, frame)
    setupUI()
  }
  
  // vm, boardTypeFIXME: - vm, boardType를 추가 구현해야 합니다. 디퐅트 값 넣음.
  required init?(coder: NSCoder) {
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
        spreadCardsWithDelay(with: idx, view: cardView)
    }
  }
}

// MARK: - Private helper
private extension PlayerCardBoardView {
  private func spreadCardsWithDelay(with idx: Int, view: UIView) {
    UIView.animate(
      withDuration: 0.1,
      delay: 0.1 * Double(idx),
      options: .curveEaseInOut
    ) {
      view.transform = .identity
      view.alpha = 1
    }
  }
  
  func initCards(with cardsFrameList: [CGRect]) {
    guard vm.boardType == .A else {
      cardViews = initLuckyCardViewWhenBoardTypeIsOther(with: cardsFrameList)
      return
    }
    cardViews = initLuckyCardViewWhenBoardTypeIsMe(with: cardsFrameList)
  }
  
  func initLuckyCardViewWhenBoardTypeIsOther(with cardsFrameList: [CGRect]) -> [LuckyCardView] {
    return (0..<vm.playerCardsCountInBoard()).map {
        let viewModel = LuckyCardViewModel(
          gameManager: vm.gameManager,
          cardModel: vm.showPlayerCard($0))
        return LuckyCardView(
          frame: cardsFrameList[$0],
          viewModel: viewModel,
          cardAppearance: .rear)
    }
  }
  
  func initLuckyCardViewWhenBoardTypeIsMe(with cardsFrameList: [CGRect]) -> [LuckyCardView] {
    return (0..<vm.playerCardsCountInBoard()).map {
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
    let headCount = vm.playerHeadCount()
    let cardSize = Constant.intrinsicCardSize(from: self)
    var startX: CGFloat = 0
    let interItemSpacing = updateStartXForMakeCardViewsFrame(
      from: headCount,
      startX: &startX)
    
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
  
  func updateStartXForMakeCardViewsFrame(
    from headCount: PlayerHeadCountType,
    startX: inout CGFloat
  ) -> UISpacing {
    switch headCount {
    case .three:
      startX = Constant.HeadCount.IsThree.edgeSpacing.leading
      return Constant.interItemSpacing(
        from: self,
        edgeSpacing: Constant.HeadCount.IsThree.edgeSpacing,
        headCount: headCount)
    case .four:
      startX = Constant.HeadCount.IsFour.edgeSpacing.leading
      return Constant.interItemSpacing(
        from: self,
        edgeSpacing: Constant.HeadCount.IsFour.edgeSpacing,
        headCount: headCount)
    case .five:
      startX = Constant.HeadCount.IsFive.edgeSpacing.leading
      return Constant.interItemSpacing(
        from: self,
        edgeSpacing: Constant.HeadCount.IsFive.edgeSpacing,
        headCount: headCount)
    }
  }
}
