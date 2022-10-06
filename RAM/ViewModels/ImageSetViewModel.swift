//
//  ImageSetViewModel.swift
//  RAM
//
//  Created by Willie Liwa Johnson on 10/6/22.
//

import Foundation

class ImageSetViewModel: ObservableObject {
  @Published private var model: ImageSets = .init()

  var sets: [ImageSetItem] {
    model.sets
  }
}

// MARK: - Intent(s)

extension ImageSetViewModel {
  func add(_ imageSet: ImageSetItem) {
    model.add(imageSet)
  }

  func edit(_ imageSet: ImageSetItem) {
    model.edit(imageSet)
  }

  func delete(_ imageSet: ImageSetItem) {
    model.delete(imageSet)
  }
}
