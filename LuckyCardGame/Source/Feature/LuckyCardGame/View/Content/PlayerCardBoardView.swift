//
//  PlayerGameBoardView.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//

import UIKit

final class PlayerCardBoardView: BaseView {
  // MARK: - Properties
  let alphabetLabel = UILabel().set {
    $0.translatesAutoresizingMaskIntoConstraints = false
    let textSize = Constant.AlphabetLabel.textSize
    let font = UIFont.systemFont(ofSize: textSize)
    let attrStr = NSMutableAttributedString(string: ":)")
    let italicPlusBoldFontDescriptor = font.fontDescriptor.withSymbolicTraits([.traitItalic, .traitBold])!
    let italicPlusBoldFont = UIFont(descriptor: italicPlusBoldFontDescriptor, size: textSize)
    let attributes: [NSAttributedString.Key: Any] = [
      .font: italicPlusBoldFont,
      .foregroundColor: Constant.AlphabetLabel.textColor]
    attrStr.addAttributes(attributes, range: NSRange(location: 0, length: ":)".count))
    $0.attributedText = attrStr
  }
  
  var boardType: PlayerBoardType!
  
  // MARK: - Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = true
    layer.cornerRadius = Constant.radius
    backgroundColor = Constant.bgColor
  }
  
  required init?(coder: NSCoder) { fatalError() }
  
  convenience init() {
    self.init(frame: .zero)
  }
  
  // MARK: - LayoutSupport
  override func addSubviews() {
    _=[alphabetLabel].map { addSubview($0) }
  }
  
  override func setConstraints() {
    _=[alphabetLabelConstraints].map { NSLayoutConstraint.activate($0) }
  }
}

// MARK: - Helper
extension PlayerCardBoardView {
  func configure(with boardType: PlayerBoardType) {
    self.boardType = boardType
    alphabetLabel.text = boardType.toString
  }
}

// MARK: - Private helper
private extension PlayerCardBoardView {
  func setAlphabetLabel(with text: String) {
    _=alphabetLabel.set {
      let curAttrStr = $0.attributedText ?? NSAttributedString(string: "")
      let attrStr = NSMutableAttributedString(attributedString: curAttrStr)
      attrStr.mutableString.setString(text)
      $0.attributedText = attrStr

    }
  }
}

// MARK: - Layout support helper
extension PlayerCardBoardView {
  var alphabetLabelConstraints: [NSLayoutConstraint] {
    [alphabetLabel.leadingAnchor.constraint(
      equalTo: leadingAnchor,
      constant: Constant.AlphabetLabel.spacing.leading),
     alphabetLabel.centerYAnchor.constraint(
      equalTo: centerYAnchor)]
  }
}
