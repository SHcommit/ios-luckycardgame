//
//  SelectedLuckyCardDeckImplTests.swift
//  LuckyCardGameTests
//
//  Created by 양승현 on 2023/07/14.
//

import XCTest
@testable import LuckyCardGame

class SelectedLuckyCardDeckImplTests: XCTestCase {
  let stub = StubLuckyGame(headCount: .five)
  var sut: SelectedLuckyCardDeckImpl!
  
  // MARK: - Lifecycle
  override func setUp() {
    super.setUp()
    stub.setupLuckyCardDeckImls()
  }

  override func tearDown() {
    super.tearDown()
    sut = nil
  }
  
  // MARK: - Tests
  func testSelectedLuckyCardDeckImpl_WhenExecutingTheIsCardDeckItemsAllSameWithDifferenceCardsInTheDeck_ShouldReturnEqual() {
    // Arrange
    sut = SelectedLuckyCardDeckImpl(
      cards: (0..<3).map { stub.cardDeck!.cards[$0] })
    
    // Act
    let checkedTheCardsAllSameNumber = sut.isCardDeckItemsAllSame()
    
    // Assert
    XCTAssertEqual(
      checkedTheCardsAllSameNumber,
      false,
      "The isCardDeckItemsAllSame() should have returned Equal for check difference cards in the deck false, but it has returned Not Equal.")
  }
  
  func testSelectedLuckyCardDeckImpl_WhenExecutingTheIsCardDeckItemsAllSameWithSameCardsInTheDeck_ShouldReturnEqual() {
    // Arrange
    sut = SelectedLuckyCardDeckImpl(
      cards: (0..<3).map { _ in return stub.cardDeck!.cards[10] })

    // Act
    let checkedTheCardsAllSameNumber = sut.isCardDeckItemsAllSame()

    // Assert
    XCTAssertEqual(
      checkedTheCardsAllSameNumber,
      true,
      "The isCardDeckItemsAllSame() should have returned Equal for check difference cards in the deck false, but it has returned Not Equal.")
  }
}
