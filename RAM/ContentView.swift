//
//  ContentView.swift
//  RAM
//
//  Created by Willie Liwa Johnson on 10/1/22.
//

import Foundation
import SwiftUI

struct ContentView: View {
  @Environment(\.presentationMode) private var presentationMode
  @ObservedObject var gameViewModel: GameViewModel
  let chooseTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//  let cardTimer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()

  init(_ gameViewModel: GameViewModel) {
    self.gameViewModel = gameViewModel
  }

  @State private var gameCompleteAlert: Bool = false

  var body: some View {
    VStack {
      AspectVGridView(items: gameViewModel.cards, aspectRatio: ViewConstants.gridAspectRatio) { card in
        if card.isMatched, !card.isActive {
          Color.clear
        } else {
          CardView(card: card)
            .foregroundColor(gameViewModel.imageSet.color)
            .padding(ViewConstants.cardPadding)
            .transition(.scale)
//            .onTapGesture { withAnimation(.easeInOut(duration: ViewConstants.chooseAnimDuration)) {
//              gameViewModel.choose(card)
//              gameCompleteAlert = gameViewModel.areAllCardsActive()
//            }
//            }
        }
      }.onReceive(chooseTimer) { _ in
        withAnimation(.easeInOut(duration: ViewConstants.chooseAnimDuration)) {
          gameViewModel.chooseRandom()
        }
      }
      Spacer()
      HStack {
        Button(Locale.GameView.restart) {
          withAnimation(Animation.spring()) {
            gameViewModel.restart()
          }
        }.padding()
        Spacer()
        Text(Locale.GameView.score(gameViewModel.getScore()))
          .font(.title2).padding()
        Spacer()
        Button("shuffle") {
          withAnimation(Animation.spring()) {
            gameViewModel.shuffle()
          }
        }.padding()
      }.padding()
    }
    .navigationTitle("\(gameViewModel.imageSet.name)")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(Locale.GameView.restart) {
          withAnimation(Animation.spring()) {
            gameViewModel.restart()
          }
        }
        Button("shuffle") {
          withAnimation(Animation.spring()) {
            gameViewModel.shuffle()
          }
        }
      }
    }
    .alert(
      Locale.GameView.congratulations(gameViewModel.getScore()),
      isPresented: $gameCompleteAlert
    ) {
      Button(Locale.GameView.ok, role: .cancel) {
        gameViewModel.restart()
        presentationMode.wrappedValue.dismiss()
      }
      Button(Locale.GameView.newGame) {
        withAnimation {
          gameViewModel.restart()
        }
      }
    }
  }

  private enum ViewConstants {
    static let gridAspectRatio: CGFloat = 1
    static let cardPadding: CGFloat = 5
    static let chooseAnimDuration: Double = 0.5
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let previewContentViewModel = GameViewModel(ImageSetItem(
      name: "Random",
      color: .red,
      pairCount: 12,
      images: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨",
               "🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓",
               "📁", "⌚", "📱", "📲", "💻", "⌨️", "🖥", "🖨", "🖱"]
    ))

    ContentView(previewContentViewModel)
      .environment(\.locale, .init(identifier: "en"))
      .preferredColorScheme(.dark)

    ContentView(previewContentViewModel)
      .environment(\.locale, .init(identifier: "es"))
      .preferredColorScheme(.light)
  }
}
