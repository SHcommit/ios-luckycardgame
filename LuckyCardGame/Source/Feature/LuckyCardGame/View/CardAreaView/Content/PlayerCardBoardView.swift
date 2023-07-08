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
    enum AlphabetLabel {
      static let textColor: UIColor = .gray.withAlphaComponent(0.5)
      static let textSize: CGFloat = 40
      static let labelSize: CGSize = UILabel().set {
        PlayerCardBoardView.setAlphabetLabel($0)
        $0.sizeToFit()
      }.bounds.size
      static let spacing: UISpacing = .init(leading: 15)
    }
  }
  
  // MARK: - Properties
  private var alphabetLabel: UILabel!
  
  private var boardType: PlayerBoardType!
  
  // MARK: - Lifecycle
  init(frame: CGRect) {
    super.init(with: .playerCardBoardView, frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }
}

// MARK: - Helper
extension PlayerCardBoardView {
  func configure(with boardType: PlayerBoardType) {
    self.boardType = boardType
    setAlphabetLabel(with: boardType.description)
  }
}

// MARK: - Private helper
private extension PlayerCardBoardView {
  static func setAlphabetLabel(_ label: UILabel) {
    let textSize = Constant.AlphabetLabel.textSize
    let font = UIFont.systemFont(ofSize: textSize)
    let attrStr = NSMutableAttributedString(string: "A")
    let italicPlusBoldFontDescriptor = font.fontDescriptor.withSymbolicTraits([.traitItalic, .traitBold])!
    let italicPlusBoldFont = UIFont(descriptor: italicPlusBoldFontDescriptor, size: textSize)
    let attributes: [NSAttributedString.Key: Any] = [
      .font: italicPlusBoldFont,
      .foregroundColor: Constant.AlphabetLabel.textColor]
    attrStr.addAttributes(attributes, range: NSRange(location: 0, length: "A".count))
    label.attributedText = attrStr
    label.sizeToFit()
  }
  
  func setAlphabetLabel(with text: String) {
    _=alphabetLabel.set {
      let curAttrStr = $0.attributedText ?? NSAttributedString(string: "A")
      let attrStr = NSMutableAttributedString(attributedString: curAttrStr)
      attrStr.mutableString.setString(text)
      $0.attributedText = attrStr
    }
  }
}

// MARK: - LayoutSupport
extension PlayerCardBoardView: LayoutSupport {
  func createSubviews() {
    alphabetLabel = .init(frame: alphabetLabelFrame).set {
      PlayerCardBoardView.setAlphabetLabel($0)
    }
  }
  
  func addSubviews() {
    addSubview(alphabetLabel)
  }
}

// MARK: - LayoutSupport helper
extension PlayerCardBoardView {
  var alphabetLabelFrame: CGRect {
    let y = (bounds.height - Constant.AlphabetLabel.labelSize.height)/2.0
    return .init(
      x: Constant.AlphabetLabel.spacing.leading,
      y: y,
      width: Constant.AlphabetLabel.labelSize.width,
      height: Constant.AlphabetLabel.labelSize.height)
  }
}
