//
//  LuckyGameTests.swift
//  LuckyCardGameTests
//
//  Created by 양승현 on 2023/07/12.
//

import XCTest
@testable import LuckyCardGame

// MARK: - 플레이어가 5명일 때 test입니다.
class LuckyGameTests: XCTestCase {
  // MARK: - Properties
  var sut: LuckyGame!
  var stubGameManager: StubLuckyGame! = StubLuckyGame(headCount: .five)
  
  // MARK: - Lifecycle
  override func setUp() {
    super.setUp()
    sut = LuckyGame(headCount: .five)
  }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
}

// MARK: - Tests [1-4] game logic requirements
extension LuckyGameTests {
  func testLuckyGame_WhenDivideCardsToPlayerCheckTheCardsCount_ShouldReturnEqual() {
    // Arrange
    let playerOwnCardsCount = stubGameManager.playerOwnCardsCount
    
    // Act
    let dividedCardsToPlayer = sut.divideCardsToPlayer(in: .A).count
    
    // Assert
    XCTAssertEqual(
      playerOwnCardsCount,
      dividedCardsToPlayer,
      "The divideCardsToPlayer(in:) should have returnd Equal for divide cards to player, but it has returnd Not Equal")
  }
  
  func testLuckyGame_WhenDivideCardsToPlayerAndCheckDividedCardInfo_ShouldReturnEqual() {
    // Arrange
    let playerOwnCardsCount = stubGameManager.playerOwnCardsCount
    guard let mySelfCardDeck = sut.luckyCardDeckImpl else {
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

  func testLuckyGame_WhenDivideCardsToFivePlayerAndCheckEachDeck_ShouldReturnNotEqual() {
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
  
  func testLuckyGame_WhenDivideRemainingCardsToFooter_ShouldReutrnNotEqual() {
    // Arrange
    let eachPlayersDeck: [Card] = stubGameManager
      .showAllPlayerCards()
    
    // Act
    let dividedRemainingCards = sut.divideRemainingCardsToFooter()
    
    // Assert
    XCTAssertNotEqual(
      eachPlayersDeck,
      dividedRemainingCards,
      "The divideRemainingCardsToFooter() should has returned Not Equal, but it has returned Equal")
  }
  
  func testLuckyGame_WhenShowPlayerCardThenComparedReceivedCardDescriptionIsEqualToOriginCardDescriptionInCardDeck_ShouldReturnEqual() {
    // Arrange
    let aCard = sut.players[0].cardDeck.cards[3]
    
    // Act
    let receivedCard = sut.showPlayerCard(with: .A, at: 3)

    // Assert
    XCTAssertEqual(
      aCard.description(),
      receivedCard.description())
  }
}

// MARK: - Test helper
extension LuckyGameTests {
  func failureExpression(_ onePlayer: String, _ anotherPlayer: String) -> String {
    return "The divideCardsToPlayer(in:) has been called for \(onePlayer), \(anotherPlayer) player that should return Not Equal each player's cards, but it has returned Equal"
  }
}
