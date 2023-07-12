//
//  StubLuckyCardGameManagerTests.swift
//  LuckyCardGameTests
//
//  Created by 양승현 on 2023/07/12.
//

import XCTest
@testable import LuckyCardGame

class StubLuckyCardGameManagerTests: XCTestCase {
  // MARK: -  Properties
  var sut: StubLuckyCardGameManager!
  
  // MARK: - Lifecycle
  override func setUp() {
    super.setUp()
    sut = StubLuckyCardGameManager(headCount: .five)
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
}

// MARK: - Test
extension StubLuckyCardGameManagerTests {
  func testStubLuckyCardGameManager_WhenCalledInitCardDecks_ShouldReturnTrue() {
    // Arrange
    var cards: [LuckyCard] = []
    
    // Act
    cards = sut.initCardDeck()
    
    // Assert
    XCTAssertEqual(
      cards.count,
      sut.numberOfCards,
      "The initCardDeck() should have returned equal to match the excepted constant value of \(sut.numberOfCards), but it has return not equal ")
  }
}
