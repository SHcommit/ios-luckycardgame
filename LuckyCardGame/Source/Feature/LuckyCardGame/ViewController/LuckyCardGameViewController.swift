//
//  LuckyCardGameViewController.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import UIKit

class LuckyCardGameViewController: UIViewController {
  // MARK: - Properties
  private var luckyCardGameView: LuckyCardGameView!
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.luckyCardGameView = LuckyCardGameView(frame: .zero)
    luckyCardGameView.layout(from: view)
    _=LuckyCardDeckImpl()
    print(view.bounds)
  }
}
