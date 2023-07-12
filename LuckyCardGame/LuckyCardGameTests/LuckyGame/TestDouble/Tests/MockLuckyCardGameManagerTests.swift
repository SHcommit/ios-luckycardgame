//
//  MockLuckyCardGameManagerTests.swift
//  LuckyCardGameTests
//
//  Created by 양승현 on 2023/07/12.
//

import XCTest
@testable import LuckyCardGame

// MARK: - 플레이어가 5명일 때 test입니다.
class MockLuckyCardGameManagerTests: XCTestCase {
  // MARK: - Properties
  var sut: MockLuckyCardGameManager!
  var stubGameManager: StubLuckyCardGameManager! = StubLuckyCardGameManager(headCount: .five)
  
  // MARK: - Lifecycle
  override func setUp() {
    super.setUp()
    let cardDeck: LuckyCardDeckImpl = LuckyCardDeckImpl(
      cards: stubGameManager.initCardDeck())
    sut = MockLuckyCardGameManager(
      cardDeck: cardDeck,
      headCount: .five)
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
}

// MARK: - Tests [1-4] game logic requirements
extension MockLuckyCardGameManagerTests {
  func testMockLuckyCardGameManager_WhenDivideCardsToPlayerCheckTheCardsCount_ShouldReturnEqual() {
    // Arrange
    let playerOwnCardsCount = PlayerHeadCountType
      .five
      .playerCardsCountInBoard
    
    // Act
    let dividedCardsToPlayer = sut.divideCardsToPlayer(in: .A).count
    
    // Assert
    XCTAssertEqual(
      playerOwnCardsCount,
      dividedCardsToPlayer,
      "The divideCardsToPlayer(in:) should have returnd Equal for divide cards to player, but it has returnd Not Equal")
  }
  
  func testMockLuckyCardGameManager_WhenDivideCardsToPlayerAndCheckDividedCardInfo_ShouldReturnEqual() {
    // Arrange
    let playerOwnCardsCount = PlayerHeadCountType
      .five
      .playerCardsCountInBoard
    guard let mySelfCardDeck = sut.cardDeck else {
      XCTAssertTrue(
        false,
        "The MockLuckyCardGameManager.cardDeck should have returned Equal cuz Stub's initCardDeck() returned expexted value, but it has returned Not Equal")
      return
    }
    let expectedMySelfCards: [LuckyCard] = (0..<playerOwnCardsCount)
      .map {
        mySelfCardDeck.cards[$0]
      }
    
    // Act
    let dividedCards = sut.divideCardsToPlayer(in: .A)
    
    // Assert
    XCTAssertEqual(
      expectedMySelfCards,
      dividedCards,
      "The divideCardsToPlayer(in:) should have returned Equal for divide cards to A player, but it has returned Not Equal")
  }

  func testMockLuckyCardGameManager_WhenDivideCardsToFivePlayerAndCheckEachDeck_ShouldReturnNotEqual() {
    // Arrange
    let aPlayerDeck: [Card] = sut.divideCardsToPlayer(in: .A)
    let bPlayerDeck: [Card] = sut.divideCardsToPlayer(in: .B)
    let cPlayerDeck: [Card] = sut.divideCardsToPlayer(in: .C)
    let dPlayerDeck: [Card] = sut.divideCardsToPlayer(in: .D)
    let ePlayerDeck: [Card] = sut.divideCardsToPlayer(in: .E)
    let eachPlayerDecks = [aPlayerDeck, bPlayerDeck, cPlayerDeck, dPlayerDeck, ePlayerDeck]
    
    // Assert
    _=(1..<5).map {
      XCTAssertNotEqual(eachPlayerDecks[$0-1], eachPlayerDecks[$0])
    }
  }
  
  func testMockLuckyCardGame_WhenDivideRemainingCardsToFooter_ShouldReutrnNotEqual() {
    // Arrange
    let eachPlayersDeck: [Card] = sut
      .showAllPlayerCards()
    
    // Act
    let dividedRemainingCards = sut.divideRemainingCardsToFooter()
    
    // Assert
    XCTAssertNotEqual(
      eachPlayersDeck,
      dividedRemainingCards,
      "The divideRemainingCardsToFooter() should has returned Not Equal, but it has returned Equal")
  }
}

// MARK: - Test helper
extension MockLuckyCardGameManagerTests {
  func failureExpression(_ onePlayer: String, _ anotherPlayer: String) -> String {
    return "The divideCardsToPlayer(in:) has been called for \(onePlayer), \(anotherPlayer) player that should return Not Equal each player's cards, but it has returned Equal"
  }
}
