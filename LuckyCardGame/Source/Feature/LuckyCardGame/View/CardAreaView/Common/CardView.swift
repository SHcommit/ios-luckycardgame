//
//  CardView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/08.
//

import UIKit

final class LuckyCardView: UIView {
  // MARK: - Constant
  struct Constant {
    enum LeftTopNumberLabel {
      static let fontSize: CGFloat = 12
      static let spacing: UISpacing = .init(
        leading: 10, top: 10)
    }
    
    enum RightTopNumberLabel {
      static let fontSize: CGFloat = 12
      static func computedSpacing(
        from superView: UIView?,
        subview me: UIView?
      ) -> UISpacing {
        guard
          let superView = superView,
          let me = me
        else {
          return .init()
        }
        me.sizeToFit()
        let leftSpacing = superView.bounds.width - me.bounds.width - 10
        let topSpacing = superView.bounds.height - me.bounds.height - 10
        return .init(leading: leftSpacing, top: topSpacing)
      }
    }
    
    enum EmojiLabel {
      static let fontSize: CGFloat = 30
      static func computedSpacing(
        from superView: UIView?,
        subview me: UIView?
      ) -> UISpacing {
        guard
          let superView = superView,
          let me = me
        else {
          return .init()
        }
        me.sizeToFit()
        let leadingSpacingForCenterX = superView.bounds.width/2.0 - me.bounds.width/2.0
        let topSpacingForCenterY = superView.bounds.height - me.bounds.height - 10
        return .init(
          leading: leadingSpacingForCenterX,
          top: topSpacingForCenterY)
      }
    }
  }
  
  // MARK: - Properties
  private var vm: LuckyCardViewModelProtocol!
  
  private var leftTopNumberLabel: UILabel?
  
  private var emojiLabel: UILabel?
  
  private var rightBottomNubmerLabel: UILabel?
  
  private override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  // MARK: - Lifecycle
  init(frame: CGRect, viewModel: LuckyCardViewModelProtocol) {
    vm = viewModel
    super.init(frame: frame)
    setupUI()
  }
  
  // viewModelFIXME: - viewModel 초기화 하지 않았습니다.
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }
}

// MARK: - LayoutSupport
extension LuckyCardView: LayoutSupport {
  func createSubviews() {
    leftTopNumberLabel = UILabel(frame: leftTopNumberLabelFrame)
    emojiLabel = UILabel(frame: emojiLabelFrame)
    rightBottomNubmerLabel = UILabel(frame: rightBottomNumberLabelFrame)
  }
  
  func addSubviews() {
    guard
      let leftTopNumberLabel = leftTopNumberLabel,
      let rightBottomNubmerLabel = rightBottomNubmerLabel,
      let emojiLabel = emojiLabel
    else {
      print("DEBUG: Subview is optional")
      return
    }
    _=[leftTopNumberLabel,
       emojiLabel,
       rightBottomNubmerLabel]
      .map {
        addSubview($0)
      }
  }
}

// MARK: - LayoutSupport helper
private extension LuckyCardView {
  var leftTopNumberLabelFrame: CGRect {
    guard let leftTopNLabel = leftTopNumberLabel else { return .zero }
    let spacing = LuckyCardView.Constant.LeftTopNumberLabel.spacing
    
    return .init(
      x: spacing.leading,
      y: spacing.top,
      width: leftTopNLabel.bounds.width,
      height: leftTopNLabel.bounds.height)
  }
  
  var emojiLabelFrame: CGRect {
    guard let emojiLabel = emojiLabel else { return .zero }
    let spacing = LuckyCardView
      .Constant
      .RightTopNumberLabel
      .computedSpacing(from: self, subview: emojiLabel)
    return .init(
      x: spacing.leading,
      y: spacing.top,
      width: emojiLabel.bounds.width,
      height: emojiLabel.bounds.height)
  }
  
  var rightBottomNumberLabelFrame: CGRect {
    guard let rightBottomNLabel = rightBottomNubmerLabel else { return .zero }
    let spacing = LuckyCardView
      .Constant
      .RightTopNumberLabel
      .computedSpacing(from: self, subview: rightBottomNLabel)
    return .init(
      origin: .init(x: spacing.leading, y: spacing.top),
      size: .init(
        width: rightBottomNLabel.bounds.width,
        height: rightBottomNLabel.bounds.height))
  }
}
