//
//  LuckyCardDeckImplTests.swift
//  LuckyCardGameTests
//
//  Created by 양승현 on 2023/07/11.
//

import XCTest
import Foundation
@testable import LuckyCardGame

// TODO: - 플레이어가 다섯 명 일때
class LuckyCardDeckImplTests: XCTestCase {
  
  // MARK: - Properties
  private let gameManager = StubLuckyCardGameManager(headCount: .five)
  
  private var sut: MockLuckyCardImpl!
  
  // MARK: - Action
  override func setUp() {
    super.setUp()
    sut = MockLuckyCardImpl(cards: gameManager.initCardDeck())
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
}

extension LuckyCardDeckImplTests {
  func testLuckyCardDeckImpl_WhenCalledCardDeckDescriptionAndMustSameCountBetweenCardDeckAndSplitedCard_ShouldReturnTrue() {
    // Arrange
    let cardDescription: String = sut.description
    var splitedCardDescriptionCount: Int = 0
    let numberOfTotalLuckyCards = LuckyCardGameManager
      .Constant
      .LuckyCard
      .numberOfCards
    
    // Act
    splitedCardDescriptionCount = cardDescription.split{$0==","}.count

    // Asset
    XCTAssertEqual(
      numberOfTotalLuckyCards,
      splitedCardDescriptionCount,
      "The luckyCardDeckImpl's description should have returned Equal for total cards of lucky card deck that appointed LuckyCardGameManager.Constant: \(numberOfTotalLuckyCards). But it has return false")
  }
  
  func testLuckyCardDeckImpl_WhenTheCardDeckShuffledToComparePrevCardDeck_ShouldReturnNotEqual() {
    // Arrange
    let prevCardDeck = sut.cards
    
    // Act
    sut.shuffle()
    
    // Assert
    XCTAssertNotEqual(
      prevCardDeck,
      sut.cards,
      "The luckyCardDeckImpl's shuffle() should have returned Not Equal for shuffle the card deck but it has returned Equal.")
  }
  
  func testLuckyCardDeckImpl_WhenTheCardDeckContainSomeCards_ShouldReturnTrue() {
    // Arrange
    let mockLuckyCardNumbers: [LuckyCardNumberType] = [.eight, .five, .one, .six]
    let mockLuckyCardShapes: [LuckyCardShapeType] = [.cat, .cat, .cow, .dog]
    let cnt = mockLuckyCardShapes.count
    let mockLuckyCards: [LuckyCard] = (0..<cnt)
      .map {
        return LuckyCard(
          number: mockLuckyCardNumbers[$0],
          shape: mockLuckyCardShapes[$0],
          appearance: .front)
      }
    
    // Act
    let isContainLuckyCards = sut.contains(of: mockLuckyCards)
    
    // Assert
    XCTAssertTrue(
      isContainLuckyCards,
      "The contains(of:) should have returned TRUE for matching some cards in sut's card deck, but it has returned FALSE")
  }
  
  func testLuckyCardDeckImpl_WhenCalledIsContainCardDeckACard_ShouldReturnTrue() {
    // Arrange
    let aLuckyCard = gameManager.initCardDeck()[0]
    
    // Act
    let isContainALuckyCard = sut.contain(of: aLuckyCard)
    
    // Assert
    XCTAssertTrue(
      isContainALuckyCard,
      "The contain(_:) should have returned TRUE to matching a lucky card in sut's card deck, but it has returned FALSE")
  }
  
  func testLuckyCardDeckImpl_WhenTheLuckyCardDeckSorted_ShouldReturnNotEqual () {
    // Arrange
    var prevCardDeck = sut.cards
    
    // Act
    prevCardDeck.shuffle()
    prevCardDeck.sort()
    
    // Assert
    XCTAssertNotEqual(
      prevCardDeck,
      sut.cards,
      "The sort() should have returned Not Equal for sorting card deck with ascending order, but it has returned equal")
  }
  
  func testLuckyCardDeckImpl_WhenClearTHeCardDeck_ShouldReturnEqual() {
    // Act
    sut.clearDeck()
    
    // Assert
    XCTAssertEqual(
      sut.cards.count,
      0,
      "The clearDeck() should have returned Equal for cleared deck with count: \(sut.cards.count), but it has retruned Not Equal")
  }
  
  func testLuckyCardDeckImpl_WhenCalledRemoveAtInTheCardDeck_ShouldReturnNil() {
    // Act
    let removedCard = sut.remove(at: gameManager.numberOfCards)
    
    // Assert
    XCTAssertNil(
      removedCard,
      "The remove(at:) should have returned Nil cuz sut's max number of cards is \(gameManager.numberOfCards), but it has returned Not nil")
  }
}
