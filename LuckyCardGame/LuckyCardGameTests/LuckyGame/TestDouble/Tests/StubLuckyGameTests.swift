//
//  StubLuckyCardGameManagerTests.swift
//  LuckyCardGameTests
//
//  Created by 양승현 on 2023/07/12.
//

import XCTest
@testable import LuckyCardGame

class StubLuckyGameTests: XCTestCase {
  // MARK: -  Properties
  var sut: StubLuckyGame!
  
  // MARK: - Lifecycle
  override func setUp() {
    super.setUp()
    sut = StubLuckyGame(headCount: .five)
    sut.wakeUpPlayers()
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
}

// MARK: - Test
extension StubLuckyGameTests {
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
  
  func testStubLcukyCardGameManager_WhenDividedCardsToAPlayerChekcCardsCountIsEqualToBoardMaxCardCount_ShouldReturnTrue() {
    // Act
    let APlayerDividedCardsCount = sut.divideCardsToPlayer(in: .B).count
    
    // Assert
    XCTAssertEqual(
      APlayerDividedCardsCount,
      sut.headCount.bottomCardsCountInBoard,
      "The divideCardsToPlayer(in:) should have returned Equal, but it has returned Not Equal cards.")
  }
}
