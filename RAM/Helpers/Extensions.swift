//
//  Extensions.swift
//  RAM
//
//  Created by Willie Liwa Johnson on 10/3/22.
//

import Foundation
import SwiftUI

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

extension Color {
  static func random(hue: CGFloat? = nil, _ saturation: CGFloat? = nil, _ brightness: CGFloat? = nil) -> Color {
    let hue = hue == nil ? CGFloat.random(in: 0 ... 1) : hue
    let saturation = saturation == nil ? CGFloat.random(in: 0 ... 1) : saturation
    let brightness = brightness == nil ? CGFloat.random(in: 0 ... 1) : brightness
    return Color(hue: hue!, saturation: saturation!, brightness: brightness!)
  }
}
