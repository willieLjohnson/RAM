//
//  CardModel.swift
//  RAM
//
//  Created by Willie Liwa Johnson on 10/3/22.
//

import SwiftUI

struct CardItem: Identifiable {
  let id: UUID = .init()
  var isActive: Bool = false
  var isMatched: Bool = false
  let content: String
}

struct Cards {
  private(set) var cards: [CardItem]
  private(set) var score: Int

  private var indexOfFirstCard: Int? {
    get { cards.indices.filter { cards[$0].isActive }.oneAndOnly }
    set { cards.indices.forEach { cards[$0].isActive = ($0 == newValue) } }
  }

  init(numberOfPairs: Int, createContent: (Int) -> String) {
    cards = []
    score = 0

    // add numberOfPairds x 2 cards
    for pairIndex in 0 ..< numberOfPairs {
      let content: String = createContent(pairIndex)
      cards.append(CardItem(content: content))
      cards.append(CardItem(content: content))
    }
    cards.shuffle()
  }

  // TODO: Create initalize for random card
  // init(createRandomContent: (Int) -> String )

  mutating func chooseeee(_ card: CardItem) {
    // check if card exists and is not active or matched.
    guard let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) else { return }
    guard !cards[chosenIndex].isActive else { return }
    guard !cards[chosenIndex].isMatched else { return }
    // is this the first card being picked?
    guard let possibleMatchIndex = indexOfFirstCard else {
      indexOfFirstCard = chosenIndex
      return
    }
    if cards[chosenIndex].content == cards[possibleMatchIndex].content {
      cards[chosenIndex].isMatched = true
      cards[possibleMatchIndex].isMatched = true
      score += 3
    }

    cards[chosenIndex].isActive.toggle()

    if score > 0 {
      score -= 1
    }
  }

  mutating func choose(_ card: CardItem) {
    if let chosenIndex =
      cards.firstIndex(where: { $0.id == card.id }),
      !cards[chosenIndex].isActive,
      !cards[chosenIndex].isMatched
    {
      if let potentialMatchIndex = indexOfFirstCard {
        if cards[chosenIndex].content == cards[potentialMatchIndex].content {
          cards[chosenIndex].isMatched = true
          cards[potentialMatchIndex].isMatched = true
          score += 3
        }

        cards[chosenIndex].isActive.toggle()

        if score > 0 {
          score -= 1
        }
      } else {
        indexOfFirstCard = chosenIndex
      }
    }
  }

  mutating func areAllCardsActive() -> Bool {
    var allCardsActive = [Bool]()
    cards.forEach { card in
      allCardsActive.append(card.isMatched)
    }

    return allCardsActive.allSatisfy { $0 == true }
  }
}
