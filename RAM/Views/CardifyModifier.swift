//
//  CardifyModifier.swift
//  RAM
//
//  Created by Willie Liwa Johnson on 10/6/22.
//

import SwiftUI

struct CardifyModifier: ViewModifier, Animatable {
  var animatableData: Double {
    get { rotation }
    set { rotation = newValue }
  }

  var rotation: Double

  init(isActive: Bool) {
    rotation = isActive ? 0 : 180
  }

  func body(content: Content) -> some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: ViewConstants.cardCornerRadius)
      if rotation < 90 {
        shape.fill().foregroundColor(.white)
        shape.strokeBorder(lineWidth: ViewConstants.cardLineWidth)
      } else {
        shape.fill()
      }
      content.opacity(rotation < 90 ? 1 : 0)
    }
    .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
  }

  private enum ViewConstants {
    static let cardCornerRadius: CGFloat = 10
    static let cardLineWidth: CGFloat = 3
  }
}

extension View {
  func cardify(isActive: Bool) -> some View {
    modifier(CardifyModifier(isActive: isActive))
  }
}
