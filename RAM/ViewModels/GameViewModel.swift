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

  init(_ imageSet: ImageSetItem) {
    cardsSet = Cards(numberOfPairs: imageSet.pairCount) { pairIndex in
      imageSet.images[pairIndex]
    }
    self.imageSet = imageSet
  }

  var cards: [CardItem] {
    cardsSet.cards
  }
}

// MARK: - Intent(s)

extension GameViewModel {
  func restart() {
    imageSet = ImageSets().getRandom()
    cardsSet = Cards(numberOfPairs: imageSet.pairCount, createContent: { pairIndex in
      imageSet.images[pairIndex]
    })
  }

  func choose(_ card: CardItem) {
    cardsSet.choose(card)
  }

  func getScore() -> Int {
    cardsSet.score
  }

  func areAllCardsActive() -> Bool {
    cardsSet.areAllCardsActive()
  }
}
