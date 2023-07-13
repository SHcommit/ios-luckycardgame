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
  private let gameManager = StubLuckyGame(headCount: .five)
  
  private var sut: LuckyCardDeckImpl!
  
  // MARK: - Action
  override func setUp() {
    super.setUp()
    sut = LuckyCardDeckImpl(cards: gameManager.initCardDeck())
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
}

extension LuckyCardDeckImplTests {
  func testLuckyCardDeckImpl_WhenCalledTheCardDeckDescriptionAndMustSameEachCardsCountBetweenCardDeckAndSplitedCard_ShouldReturnTrue() {
    // Arrange
    let cardDescription: String = sut.description
    var splitedCardDescriptionCount: Int = 0
    let numberOfTotalLuckyCards = LuckyGame
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
  
  func testLuckyCardDeckImpl_WhenTheCardDeckShuffledCompareToPrevCardDeck_ShouldReturnNotEqual() {
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
  
  func testLuckyCardDeckImpl_WhenTheCardDeckContainCheckSomeCards_ShouldReturnTrue() {
    // Arrange
    let stubLuckyCardNumbers: [LuckyCardNumberType] = [.eight, .five, .one, .six]
    let stubLuckyCardShapes: [LuckyCardShapeType] = [.cat, .cat, .cow, .dog]
    let cnt = stubLuckyCardShapes.count
    let stubLuckyCards: [LuckyCard] = (0..<cnt)
      .map {
        return LuckyCard(
          number: stubLuckyCardNumbers[$0],
          shape: stubLuckyCardShapes[$0],
          appearance: .front)
      }
    
    // Act
    let isContainLuckyCards = sut.contains(of: stubLuckyCards)
    
    // Assert
    XCTAssertTrue(
      isContainLuckyCards,
      "The contains(of:) should have returned TRUE for matching some cards in sut's card deck, but it has returned FALSE")
  }
  
  func testLuckyCardDeckImpl_WhenCalledIsContainTheCardDeckACard_ShouldReturnTrue() {
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
  
  func testLuckyCardDeckImpl_WhenClearTheCardDeck_ShouldReturnEqual() {
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
  
  func testLuckyCardDeckImpl_WhenCalledShowCardWithUnderflowAndOverflowIndex_ShouldReturnNil() {
    // Act
    let receivedCardForCheckUnderflow = sut.showCard(at: -20)
    let receivedCardForCheckOverflow = sut.showCard(at: gameManager.headCount.toInt + 100)
    
    // Assert
    XCTAssertNil(
      receivedCardForCheckUnderflow,
      "The showCard(at:) should have returned Nil, for filtering underflow idx, but it has returned Not Nil ")
    
    XCTAssertNil(
      receivedCardForCheckOverflow,
      "The showCard(at:) should have returned Nil, for filtering overflow idx, but it has returned Not Nil ")
  }
  
  func testLuckyCardDeckImpl_WhenCalledShowCardWithCardsCountInnerIndex_ShouldReturnNotNil() {
    // Arrange
    sut.cards = [sut.cards[0], sut.cards[1]]
    let maxCardCnt = sut.cards.count
    
    // Act
    let receivedCard = sut.showCard(at: maxCardCnt-1)
    
    // Assert
    XCTAssertNotNil(receivedCard)

  }
}
