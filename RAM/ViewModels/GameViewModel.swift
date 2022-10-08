//
//  GameViewModel.swift
//  RAM
//
//  Created by Willie Liwa Johnson on 10/1/22.
//

import SwiftUI

class GameViewModel: ObservableObject {
  @Published private var cardsSet: Cards
  private(set) var imageSet: ImageSetItem

  public var cardHistory: [CardItem]

  init(_ imageSet: ImageSetItem) {
    cardsSet = Cards(numberOfPairs: imageSet.pairCount) { pairIndex in
      imageSet.images[pairIndex]
    }
    self.imageSet = imageSet
    cardHistory = []
  }

  var cards: [CardItem] {
    cardsSet.cards
  }
}

// MARK: - Intent(s)

extension GameViewModel {
  func restart() {
    imageSet = ImageSets().getRandom()
    imageSet.color = .random(hue: nil, 0.8, 0.6)
    cardsSet = Cards(numberOfPairs: imageSet.pairCount, createContent: { pairIndex in
      imageSet.images[pairIndex]
    })
    cardHistory = []
  }

  func shuffle() {
    cardsSet.shuffle()
  }

  func choose(_ card: CardItem) {
    cardsSet.choose(card)
    cardHistory.append(card)
    print(cardHistory)
  }

  func chooseRandom() {
    cardHistory.append(cardsSet.chooseRandom())
    print(cardHistory)
  }

  func getScore() -> Int {
    cardsSet.score
  }

  func areAllCardsActive() -> Bool {
    cardsSet.areAllCardsActive()
  }
}
