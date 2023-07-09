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
        .width - (HeadCountIsFive.edgeSpacing
          .top + HeadCountIsFive.edgeSpacing.bottom)
      
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
  
  typealias ConstThree = Constant.HeadCountIsThree
  typealias ConstFour = Constant.HeadCountIsFour
  typealias ConstFive = Constant.HeadCountIsFive
  
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

// MARK: - Private helper
private extension PlayerCardBoardView {
  func initCards() {
    let cardsCount = vm.gameManager.headCount.playerCardsCountInBoard
    guard vm.boardType == .A else {
      // other
      // MARK: - 잘하며 여기 문제잇을수도?
      cardViews = (0..<cardsCount).map {
        let viewModel = LuckyCardViewModel(
          gameManager: vm.gameManager,
          cardModel: vm.playerOwnTheDeck.cards[$0])
        // MARK: - 카드뷰 프레임 지정해야함.
        return LuckyCardView(
          frame: .zero,
          viewModel: viewModel,
          cardAppearance: .rear)
      }
      return
    }
    // me
    cardViews = (0..<cardsCount).map {
      let viewModel = LuckyCardViewModel(
        gameManager: vm.gameManager,
        cardModel: vm.playerOwnTheDeck.cards[$0])
      // MARK: - 카드뷰 프레임 지정해야함.
      return LuckyCardView(
        frame: .zero,
        viewModel: viewModel,
        cardAppearance: .front)
    }
  }
}

// MARK: - LayoutSupport
extension PlayerCardBoardView: LayoutSupport {
  func createSubviews() {
    initCards()
    
  }
  
  func addSubviews() {
    _=cardViews.map{ addSubview($0) }
  }
}

// MARK: - LayoutSupport helper
private extension PlayerCardBoardView {
  func cardViewFrame(with idx: Int) {
    
  }
}
