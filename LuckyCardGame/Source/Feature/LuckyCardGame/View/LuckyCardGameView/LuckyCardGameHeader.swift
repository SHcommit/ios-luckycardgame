//
//  LuckyCardGameHeader.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

final class LuckyCardGameHeader: BaseView {
  // MARK: - Properties
  private lazy var playerHeadCountMenu: UISegmentedControl = {
    return .init(
      items: PlayerHeadCountType
        .allCases
        .map { $0.description }
    ).set {
      $0.addTarget(
        self,
        action: #selector(didChangePlayerHeadCountMenu(segment:)),
        for: .valueChanged)
      $0.selectedSegmentIndex = PlayerHeadCountType
        .three
        .toCaseIterableIdx
      $0.backgroundColor = .systemGray6.withAlphaComponent(0.8)
    }
  }()
  
  // MARK: - Lifecycle
  init(frame: CGRect) {
    super.init(with: .NotUsing, frame)
    addSubview(playerHeadCountMenu)
    isUserInteractionEnabled = true
    playerHeadCountMenu.frame = bounds
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    addSubview(playerHeadCountMenu)
    isUserInteractionEnabled = true
    playerHeadCountMenu.frame = bounds
  }
}

// MARK: - Action
extension LuckyCardGameHeader {
  @objc func didChangePlayerHeadCountMenu(segment: UISegmentedControl) {
    let specificType = PlayerHeadCountType
      .allCases
      .first(
        where: {
          ($0.toInt - PlayerHeadCountType.count) == segment.selectedSegmentIndex }) ?? .three
    
    let userInfo: [String: PlayerHeadCountType] = [specificType.description: specificType]
    
    NotificationCenter.default.post(
      name: .playerHeadCountMenuDidChange,
      object: nil,
      userInfo: userInfo)
  }
}
