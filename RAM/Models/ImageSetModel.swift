//
//  ImageSetModel.swift
//  RAM
//
//  Created by Willie Liwa Johnson on 10/6/22.
//

import SwiftUI

struct ImageSetItem: Identifiable, Comparable {
  var id: UUID = .init()
  var name: String
  var color: Color
  var pairCount: Int
  var images: [String]

  static func < (lhs: ImageSetItem, rhs: ImageSetItem) -> Bool {
    lhs.name < rhs.name
  }
}

struct ImageSets {
  public static let defaults: [ImageSetItem] = [
    ImageSetItem(
      name: "Random",
      color: .random(hue: nil, 0.8, 0.6),
      pairCount: 12,
      images: ["🐶", "🐱", "🐭", "🍊", "📱", "📲", "💻", "🍋", "🍌", "🍉",
               "🍇", "🐹", "🚙", "🚌", "🚎", "🐻", "🐼", "🐨", "🍏", "🍎",
               "🍐", "🍓", "📁", "⌚", "⌨️", "🖨", "🖱"]
    ),
    ImageSetItem(
      name: "Animals",
      color: .random(hue: nil, 0.8, 0.6),
      pairCount: 3,
      images: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨"]
    ),
  ]

  private(set) var sets: [ImageSetItem] = ImageSets.defaults

  func getRandom() -> ImageSetItem {
    guard let randomSet = sets.randomElement() else { return ImageSets.defaults.randomElement()! }
    return randomSet
  }

  mutating func add(_ imageSet: ImageSetItem) {
    sets.append(imageSet)
  }

  mutating func edit(_ imageSet: ImageSetItem) {
    sets = sets.map { $0.id == imageSet.id ? imageSet : $0 }
  }

  mutating func delete(_ imageSet: ImageSetItem) {
    if let index = sets.firstIndex(of: imageSet) {
      sets.remove(at: index)
    }
  }
}
