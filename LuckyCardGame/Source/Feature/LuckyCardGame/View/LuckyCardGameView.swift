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
    static let intrinsicWidth = {
      let spacing = UIConstant.shared.spacing
      let screenWidth = UIConstant.shared.screenSize.width
      return screenWidth - (spacing.leading+spacing.trailing)
    }()
    
    enum Header {
      static let size: CGSize = {
        return CGSize(width: intrinsicWidth, height: 44)
      }()
    }
    
    enum ContentView {
      static let spacing: UISpacing = .init(
        top: UIConstant.shared.spacing.top)
    }
    
    enum Footer {
      static let spacing: UISpacing = .init(
        top: UIConstant.shared.spacing.top)
      
      /// 화면의 이미지를 보고 비율로 결정했습니다.
      /// 제가 캡쳐한 화면에서의 노란색, 짙은 회색 화면 비율이 70: 240이었습니다.
      ///  실제 노란색 height가 44이므로 짙은 회색은 151로 지정했습니다.
      static let height: CGFloat = 151
    }
  }

  // MARK: - Properties
  private var header: LuckyCardGameHeader!
  
  private var contentView: LuckyCardGameContentView!
  
  private var footer: LuckyCardGameFooter!
  
  // MARK: - Lifecycle
  init(frame: CGRect) {
    super.init(with: .LuckyCardGameView, frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) { fatalError() }
}

// MARK: - LayoutSupport
extension LuckyCardGameView: LayoutSupport {
  func createSubviews() {
    header = .init(frame: headerFrame)
    contentView = .init(frame: contentViewFrame)
    footer = .init(frame: footerFrame)
  }
  
  func addSubviews() {
    _=[header, contentView, footer].map { addSubview($0) }
  }
}

// MARK: - LayoutSupport helpers
extension LuckyCardGameView {
  var headerFrame: CGRect {
    .init(
      x: 0,
      y: 0,
      width:Constant.intrinsicWidth,
      height: Constant.Header.size.height)
  }
  
  var contentViewFrame: CGRect {
    let topPlusBottomSpacing = Constant.ContentView.spacing
      .top + Constant.Footer.spacing.top
    let headerHeight = Constant.Header.size.height
    let footerHeight = Constant.Footer.height
    let height = bounds.height - (topPlusBottomSpacing + headerHeight + footerHeight)
    return .init(
      x: 0,
      y: Constant.ContentView.spacing.top + headerHeight,
      width: Constant.intrinsicWidth,
      height: height)
  }
  
  var footerFrame: CGRect {
    .init(
      x: 0,
      y: bounds.height - Constant.Footer.height,
      width: Constant.intrinsicWidth,
      height: Constant.Footer.height)
  }
}
