//
//  CardView.swift
//  RAM
//
//  Created by Willie Liwa Johnson on 10/6/22.
//

import SwiftUI

struct CardView: View {
  let card: CardItem

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Text(card.content)
          .font(Font.system(size: ViewConstants.cardFontSize))
          .scaleEffect(scale(thatFits: geometry.size))
          .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
          .animation(
            .linear(duration: ViewConstants.cardAnimDuration)
              .repeatForever(autoreverses: false),
            value: card.isMatched
          )
      }
      .cardify(isActive: card.isActive)
    }
  }

  private enum ViewConstants {
    static let cardFontScale: CGFloat = 0.7
    static let cardFontSize: CGFloat = 32
    static let cardAnimDuration: Double = 1
  }

  private func scale(thatFits size: CGSize) -> CGFloat {
    min(size.width, size.height) / (ViewConstants.cardFontSize / ViewConstants.cardFontScale)
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    let previewCard = CardItem(isActive: true, content: "💩")

    CardView(card: previewCard)
      .preferredColorScheme(.dark)
      .frame(
        width: PreviewConstants.width,
        height: PreviewConstants.height
      )
      .previewLayout(.sizeThatFits)
      .padding()

    CardView(card: previewCard)
      .preferredColorScheme(.light)
      .frame(
        width: PreviewConstants.width,
        height: PreviewConstants.height
      )
      .previewLayout(.sizeThatFits)
      .padding()
  }

  private enum PreviewConstants {
    static let width: CGFloat = 150.0
    static let height: CGFloat = 150.0
  }
}
