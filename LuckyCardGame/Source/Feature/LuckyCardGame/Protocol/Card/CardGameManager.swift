//
//  CardManager.swift
//  LuckyCardGame
//
//  Created by 양승현 on 2023/07/07.
//

/// CardGameManager

/// Notes:
/// 1. CardGameManager는 카드가 진행되는 전반적인 system을 관리합니다.
/// 2. 카드 초기화 기능
/// 3. 카드덱이 갖고 있는 카드들 현재 상태 출력
/// 4. 플레이어에게 카드 분배
/// 5. 나머지 카드 footer에게 분배
protocol CardGameManager {
  associatedtype CardShape: CardShapeEnumProtocol
  associatedtype CardNumber: CardNumberEnumProtocol
  associatedtype _Card: Card<CardShape, CardNumber>
  associatedtype CardDeck: Deck
  
  var ownerPlayer: Player { get }
  var otherPlayers: [Player] { get }
  var headCount: PlayerHeadCountType { get }
  var cardDeck: CardDeck? { get }
  
  func initCardDeck() -> [_Card]
  func printCardDeckDescription()
  func divideCardsToPlayer(in board: PlayerBoardType) -> [_Card]
  func divideRemainingCardsToFooter() -> [_Card]
}
