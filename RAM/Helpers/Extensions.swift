//
//  Extensions.swift
//  RAM
//
//  Created by Willie Liwa Johnson on 10/3/22.
//

import Foundation

extension Array {
  var oneAndOnly: Element? {
    count == 1 ? first : nil
  }
}

extension RangeReplaceableCollection where Element: Hashable {
  // Unique characters in a string.
  var uniqueChars: Self {
    var set = Set<Element>()
    return filter { set.insert($0).inserted }
  }
}
