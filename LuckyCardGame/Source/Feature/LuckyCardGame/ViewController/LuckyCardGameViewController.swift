//
//  LuckyCardGameViewController.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import UIKit

final class LuckyCardGameViewController: UIViewController {
  // MARK: - Properties
  private var luckyCardGameView: LuckyCardGameView!
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
}

// MARK: - Helper
extension LuckyCardGameViewController {
  func configureUI() {
    navigationController?.navigationBar.isUserInteractionEnabled = false
    view.backgroundColor = .white
    setupUI()
  }
}

// MARK: - LayoutSupport
extension LuckyCardGameViewController: LayoutSupport {
  func createSubviews() {
    luckyCardGameView = .init(frame: luckyCardGameViewFrame)
  }
  
  func addSubviews() {
    view.addSubview(luckyCardGameView)
  }
  
}

// MARK: - LayoutSupperot helper
extension LuckyCardGameViewController {
  var luckyCardGameViewFrame: CGRect {
    let statusBarHeight = UIView.Constnat.statusBarHeight
    let safeAreaBottomHeight = UIView.Constnat.safeAreaLayoutGuideButtomHeight
    let screenSize = UIConstant.shared.screenSize
    let leadingSpacing = UIConstant.shared.spacing.leading
    return .init(
      x: leadingSpacing,
      y: statusBarHeight,
      width: screenSize.width - leadingSpacing*2,
      height: screenSize.height - safeAreaBottomHeight - statusBarHeight)
  }
}
