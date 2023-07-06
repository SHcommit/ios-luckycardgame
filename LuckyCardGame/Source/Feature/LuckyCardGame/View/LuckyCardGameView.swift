//
//  LuckyCardGameView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

/// LuckyCardGameView는 게임 플레이 화면을 담당합니다.
///
/// - Param header : 화면의 노란색 영역 화면 담당
/// - Param contentView : 플레이어들의 카드가 보여지는 영역 담당
/// - Param footer : 짙은 회색 영역 담당
///
///  **Notes:**
/// 1. Frame을 더 효율적으로 사용하기 위해 기본적인 3 영역은 auto layout으로 지정했습니다.
///   auto layout을 사용하더라도 결국에 시스템은 각각의 subviews에 대한 frame을 지정하기 때문입니다.
///   결국 오토 레이아웃과 이들의 제약조건을 통해 각 뷰에 할당될 정확한 frame을 지정합니다.
///
/// 2. 위의 경우를 이용해 결국 subviews의 frame이 지정됬을 때 재사용하는 뷰가 많은 contentView의 subviews를 frame으로 position과 size를 지정했습니다.
final class LuckyCardGameView: BaseView {
  // MARK: - Constant
  struct Constant {
    static let spacing: UISpacing = {
      let topSpacing = UIView.Constnat.statusBarHeight  + UIConstant.shared.spacing.top
      return UISpacing(top: topSpacing)
    }()
    
    enum Header {
      static let spacing: UISpacing = .init(
        leading: UIConstant.shared.spacing.leading,
        trailing: UIConstant.shared.spacing.trailing)
      static let size: CGSize = {
        let screenWidth = UIConstant.shared.screenSize.width
        return CGSize(width: screenWidth - Header.spacing.leading*2, height: 44)
      }()
    }
    
    enum ContentView {
      static let spacing: UISpacing = .init(
        leading: UIConstant.shared.spacing.leading,
        top: UIConstant.shared.spacing.top,
        trailing: UIConstant.shared.spacing.trailing)
    }
    
    enum Footer {
      static let spacing: UISpacing = .init(
        leading: UIConstant.shared.spacing.leading,
        top: UIConstant.shared.spacing.top,
        trailing: UIConstant.shared.spacing.trailing)
      
      /// 화면의 이미지를 보고 비율로 결정했습니다.
      /// 제가 캡쳐한 화면에서의 노란색, 짙은 회색 화면 비율이 70: 240이었습니다.
      ///  실제 노란색 height가 44이므로 짙은 회색은 151로 지정했습니다.
      static let height: CGFloat = 151
    }
  }

  // MARK: - Properties
  private let header = LuckyCardGameHeader(frame: .zero)
  
  private let contentView = LuckyCardGameContentView(frame: .zero)
  
  private let footer = LuckyCardGameFooter(frame: .zero)
  
  // MARK: - Lifecycle
  init(frame: CGRect) {
    super.init(with: .LuckyCardGameView, frame)
    setupUI()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if !contentView.isInitBoardViews {
      contentView.configure(with: .five)
    }
  }
  
  required init?(coder: NSCoder) { fatalError() }
}

// MARK: - Helper
extension LuckyCardGameView {
  func layout(from superView: UIView) {
    superView.addSubview(self)
    let selfConstraints = [
      leadingAnchor.constraint(equalTo: superView.leadingAnchor),
      topAnchor.constraint(
        equalTo: superView.topAnchor,
        constant: Constant.spacing.top),
      trailingAnchor.constraint(equalTo: superView.trailingAnchor),
      bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor)]
    NSLayoutConstraint.activate(selfConstraints)
  }
}

// MARK: - LayoutSupport
extension LuckyCardGameView: LayoutSupport {
  func addSubviews() {
    _=[header, contentView, footer].map { addSubview($0) }
  }
  
  func setConstraints() {
    _=[headerConstraints,
       contentViewConstraints,
       footerConstraints
    ].map {
      NSLayoutConstraint.activate($0)
    }
  }
}

// MARK: - Layout support helper
extension LuckyCardGameView {
  var headerConstraints: [NSLayoutConstraint] {
    [header.leadingAnchor.constraint(
      equalTo: leadingAnchor,
      constant: Constant.Header.spacing.leading),
     header.trailingAnchor.constraint(
      equalTo: trailingAnchor,
      constant: -Constant.Header.spacing.trailing),
     header.topAnchor.constraint(
      equalTo: topAnchor),
     header.heightAnchor.constraint(
      equalToConstant: Constant.Header.size.height)]
  }
  
  var contentViewConstraints: [NSLayoutConstraint] {
    [contentView.leadingAnchor.constraint(
      equalTo: leadingAnchor,
      constant: Constant.ContentView.spacing.leading),
     contentView.trailingAnchor.constraint(
      equalTo: trailingAnchor,
      constant: -Constant.ContentView.spacing.trailing),
     contentView.topAnchor.constraint(
      equalTo: header.bottomAnchor,
      constant: Constant.ContentView.spacing.top)]
  }
  
  var footerConstraints: [NSLayoutConstraint] {
    [footer.topAnchor.constraint(
      equalTo: contentView.bottomAnchor,
      constant: Constant.Footer.spacing.top),
     footer.leadingAnchor.constraint(
      equalTo: leadingAnchor,
      constant: Constant.Footer.spacing.leading),
     footer.trailingAnchor.constraint(
      equalTo: trailingAnchor,
      constant: -Constant.Footer.spacing.trailing),
     footer.bottomAnchor.constraint(
      equalTo: bottomAnchor),
     footer.heightAnchor.constraint(
      equalToConstant: Constant.Footer.height)]
  }
}
