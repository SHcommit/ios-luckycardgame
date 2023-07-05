//
//  LuckyCardShapeProvider.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/05.
//

import Foundation

protocol LuckyCardShapeProvider {
  func cardDescription(
    _ number: Int,
    shapeType: LuckyCardShapeType
  ) -> String 
}
