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
  }
}

// MARK: - LayoutSupport helper
extension PlayerCardBoardView {
  
}
