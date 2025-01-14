//
//  CardView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/08.
//

import UIKit

final class LuckyCardView: BaseRoundView {
  // MARK: - Constant
  struct Constant {
    enum LeftTopNumberLabel {
      static let fontSize: CGFloat = 12
      static let spacing: UISpacing = .init(
        leading: 7, top: 7)
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
        let leftSpacing = superView.bounds.width - me.bounds.width - 7
        let topSpacing = superView.bounds.height - me.bounds.height - 7
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
      static let size: CGSize = .init(width: 34, height: 34)
      static let logoName: String = "luckyLogo"
      static func computedSpacing(
        from superView: UIView?
      ) -> UISpacing {
        guard let superView = superView else {
          return .init()
        }
        let leadingSpacingForCenterX = superView.bounds.width/2.0 - size.width/2.0
        let topSpacingForCenterY = superView.bounds.height/2.0 - size.height/2.0
        return .init(
          leading: leadingSpacingForCenterX,
          top: topSpacingForCenterY)
      }
    }
    
    fileprivate enum Animation {
      static let options: AnimationOptions = [
        .curveEaseInOut,
        .transitionFlipFromLeft]
      static let duration: CGFloat = 0.45
    }
  }
  
  // MARK: - Properties
  private var vm: LuckyCardViewModelProtocol!
  
  private var leftTopNumberLabel: UILabel?
  
  private var emojiLabel: UILabel?
  
  private var rightBottomNubmerLabel: UILabel?
  
  private var logoImageView: UIImageView?
  
  private var cardAppearance: LuckyCard.Appearance
  
  private var frontViews: [UIView] {
    guard
      let leftTopNumberLabel = leftTopNumberLabel,
      let emojiLabel = emojiLabel,
      let rightBottomNubmerLabel = rightBottomNubmerLabel
    else {
      return []
    }
    return [leftTopNumberLabel, emojiLabel, rightBottomNubmerLabel]
  }
  
  // MARK: - Lifecycle
  init(frame: CGRect, viewModel: LuckyCardViewModelProtocol, cardAppearance: LuckyCard.Appearance) {
    vm = viewModel
    self.cardAppearance = cardAppearance
    super.init(with: .cardView, frame)
    configureUI()
  }
  
  // viewModelFIXME: - viewModel, appearnce 초기화 하지 않았습니다.
  required init?(coder: NSCoder) {
    cardAppearance = .front
    super.init(coder: coder)
    configureUI()
  }
}

// MARK: - Action
extension LuckyCardView {
  @objc func didTapCard() {
    updateAppearance()
  }
}

// MARK: - Helper
extension LuckyCardView {
  func updateAppearance() {
    guard cardAppearance == .rear else {
      showRearAppearanceWithAnimation()
      cardAppearance = .rear
      return
    }
    showFrontAppearanceWithAnimaiton()
    cardAppearance = .front
  }
}

// MARK: - Private helper
extension LuckyCardView {
  func configureUI() {
    layer.borderColor = UIColor.black.withAlphaComponent(0.8).cgColor
    layer.borderWidth = 0.7
    setupUI()
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCard))
    isUserInteractionEnabled = true
    addGestureRecognizer(tapGesture)
  }
  
  private func hiddenRearAppearance() {
    logoImageView?.isHidden = true
  }
  
  private func revealRearAppearance() {
    logoImageView?.isHidden = false
  }
  
  private func hiddenFrontAppearance() {
    _=frontViews.map { $0.isHidden = true }
  }
  
  private func revealFrontAppearance() {
    _=frontViews.map { $0.isHidden = false }
  }
}

// MARK: - Animation Helper
extension LuckyCardView {
  private func showFrontAppearanceWithAnimaiton() {
    UIView.transition(
      with: self,
      duration: Constant.Animation.duration,
      options: Constant.Animation.options
    ) {
      self.hiddenRearAppearance()
      self.revealFrontAppearance()
    }
  }
  
  private func showRearAppearanceWithAnimation() {
    UIView.transition(
      with: self,
      duration: Constant.Animation.duration,
      options: Constant.Animation.options
    ) {
      self.hiddenFrontAppearance()
      self.revealRearAppearance()
    }
  }
  
}

// MARK: - LayoutSupport
extension LuckyCardView: LayoutSupport {
  func createSubviews() {
    initSubviewsInRearCardAppearance()
    initSubviewsInFrontCardAppearnce()
    switch cardAppearance {
    case .front:
      hiddenRearAppearance()
    case .rear:
      hiddenFrontAppearance()
    }
  }
  
  func addSubviews() {
    addSubviewsInFrontCardAppearance()
    addSubviewsInRearCardAppearance()
  }
}

// MARK: - LayoutSupport helper
extension LuckyCardView {
  private func initLeftTopNumberLabel() -> UILabel {
    return UILabel(frame: .zero).set {
      $0.font = .monospacedSystemFont(ofSize: Constant.LeftTopNumberLabel.fontSize, weight: .heavy)
      $0.text = vm.number
      $0.sizeToFit()
    }
  }
  
  private func initEmojiLabel() -> UILabel {
    return UILabel(frame: .zero).set {
      $0.text = vm.shape
      $0.font = .systemFont(ofSize: Constant.EmojiLabel.fontSize)
      $0.sizeToFit()
    }
  }
  
  private func initRightBottomNubmerLabel() -> UILabel {
    return UILabel(frame: .zero).set {
      $0.text = vm.number
      $0.font = .monospacedSystemFont(ofSize: Constant.LeftTopNumberLabel.fontSize, weight: .heavy)
      $0.sizeToFit()
    }
  }
  
  private func initLogoImageView() -> UIImageView {
    return UIImageView(frame: .zero).set {
      $0.image = UIImage(named: Constant.LogoImageView.logoName)
    }
  }
  
  private func addSubviewsInRearCardAppearance() {
    guard let logoImageView = logoImageView else { return }
    addSubview(logoImageView)
  }
  
  private func addSubviewsInFrontCardAppearance() {
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
  
  private func initSubviewsInFrontCardAppearnce() {
    leftTopNumberLabel = initLeftTopNumberLabel()
    leftTopNumberLabel?.frame = leftTopNumberLabelFrame
    emojiLabel = initEmojiLabel()
    emojiLabel?.frame = emojiLabelFrame
    rightBottomNubmerLabel = initRightBottomNubmerLabel()
    rightBottomNubmerLabel?.frame = rightBottomNumberLabelFrame
  }
  
  private func initSubviewsInRearCardAppearance() {
    logoImageView = initLogoImageView()
    logoImageView?.frame = logoImageViewFrame
  }
}

// MARK: - LayoutSupport frame helper
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
      .EmojiLabel
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
    let spacing = LuckyCardView
      .Constant
      .LogoImageView
      .computedSpacing(from: self)
    return .init(
      x: spacing.leading,
      y: spacing.top,
      width: LuckyCardView.Constant.LogoImageView.size.width,
      height: LuckyCardView.Constant.LogoImageView.size.height)
  }
}
