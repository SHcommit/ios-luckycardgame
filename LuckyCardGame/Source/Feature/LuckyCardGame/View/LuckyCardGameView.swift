//
//  LuckyCardGameView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

final class LuckyCardGameView: BaseView {
  // MARK: - Properties
  private let header = LuckyCardGameHeader()
  
  private let contentView = LuckyCardGameContentView()
  
  private let footer = LuckyCardGameFooter()
  
  // MARK: - Lifecycle
  private override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  convenience init() {
    self.init(frame: .zero)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if !contentView.isInitBoardViews {
      contentView.configure(with: .five)
    }
  }
  
  required init?(coder: NSCoder) { fatalError() }
  
  // MARK: - LayoutSupport
  override func addSubviews() {
    _=[header, contentView, footer].map { addSubview($0) }
  }
  
  override func setConstraints() {
    _=[headerConstraints,
       contentViewConstraints,
       footerConstraints
    ].map {
      NSLayoutConstraint.activate($0)
    }
  }
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
