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
        let topSpacingForCenterY = superView.bounds.height/2.0 - me.bounds.height/2.0
        return .init(
          leading: leadingSpacingForCenterX,
          top: topSpacingForCenterY)
      }
    }
    // 뒷장일 때
    enum LogoImageView {
      static let size: CGSize = .init(width: 40, height: 40)
      static let logoName: String = Constant.LogoImageView.logoName
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
        let leadingSpacingForCenterX = superView.bounds.width/2.0 - me.bounds.width/2.0
        let topSpacingForCenterY = superView.bounds.height/2.0 - me.bounds.height/2.0
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
  
  private var logoImageView: UIImageView?
  
  private var cardAppearance: LuckyCard.Appearance
  
  private override init(frame: CGRect) {
    cardAppearance = .front
    super.init(frame: frame)
    setupUI()
  }
  
  // MARK: - Lifecycle
  init(frame: CGRect, viewModel: LuckyCardViewModelProtocol, cardAppearance: LuckyCard.Appearance) {
    vm = viewModel
    self.cardAppearance = cardAppearance
    super.init(frame: frame)
    setupUI()
  }
  
  // viewModelFIXME: - viewModel 초기화 하지 않았습니다.
  required init?(coder: NSCoder) {
    cardAppearance = .front
    super.init(coder: coder)
    setupUI()
  }
}

// MARK: - Private helper
extension LuckyCardView {
  private func addFrontCardAppearanceSubviews() {
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
  
  private func initLeftTopNumberLabel() -> UILabel {
    return UILabel(frame: leftTopNumberLabelFrame).set {
      $0.text = vm.number
      $0.font = .italicSystemFont(ofSize: Constant.LeftTopNumberLabel.fontSize)
      $0.sizeToFit()
    }
  }
  
  private func initEmojiLabel() -> UILabel {
    return UILabel(frame: emojiLabelFrame).set {
      $0.text = vm.shape
      $0.font = .systemFont(ofSize: Constant.EmojiLabel.fontSize)
      $0.sizeToFit()
    }
  }
  
  private func initRightBottomNubmerLabel() -> UILabel {
    return UILabel(frame: rightBottomNumberLabelFrame).set {
      $0.text = vm.number
      $0.font = .italicSystemFont(ofSize: Constant.RightTopNumberLabel.fontSize)
      $0.sizeToFit()
    }
  }
  
  private func initLogoImageView() -> UIImageView {
    return UIImageView(frame: logoImageViewFrame).set {
      $0.image = UIImage(named: Constant.LogoImageView.logoName)
    }
  }
}

// MARK: - LayoutSupport
extension LuckyCardView: LayoutSupport {
  func createSubviews() {
    switch cardAppearance {
    case .front:
      leftTopNumberLabel = initLeftTopNumberLabel()
      emojiLabel = initEmojiLabel()
      rightBottomNubmerLabel = initRightBottomNubmerLabel()
    case .rear:
      logoImageView = initLogoImageView()
    }
  }
  
  func addSubviews() {
    switch cardAppearance {
    case .front:
      addFrontCardAppearanceSubviews()
    case .rear:
      guard let logoImageView = logoImageView else { return }
      addSubview(logoImageView)
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
  
  var logoImageViewFrame: CGRect {
    guard let logoImageView = logoImageView else { return .zero }
    let spacing = LuckyCardView
      .Constant
      .LogoImageView
      .computedSpacing(from: self, subview: logoImageView)
    return .init(
      x: spacing.leading,
      y: spacing.top,
      width: LuckyCardView.Constant.LogoImageView.size.width,
      height: LuckyCardView.Constant.LogoImageView.size.height)
  }
}
