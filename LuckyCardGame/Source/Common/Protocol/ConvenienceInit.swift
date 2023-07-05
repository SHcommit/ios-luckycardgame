//
//  ConvenienceInit.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/04.
//
// https://github.com/devxoul/Then/blob/master/LICENSE



import Foundation

protocol ConvenienceInit {}

// extension UIView: ConvenienceInit {}
extension NSObject: ConvenienceInit { }

extension ConvenienceInit where Self: AnyObject {
  @inlinable
  internal func set(_ apply: (Self) throws -> Void) rethrows -> Self {
    try apply(self)
    return self
  }
}
