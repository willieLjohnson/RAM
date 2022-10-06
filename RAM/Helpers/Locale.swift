//
//  Locale.swift
//  RAM
//
//  Created by Willie Liwa Johnson on 10/6/22.
//

import SwiftUI

struct Locale {
  static let appName: LocalizedStringKey = .init("app-name")

  enum SetsView {
    static let delete: LocalizedStringKey = .init("delete")
    static let edit: LocalizedStringKey = .init("edit")
  }

  enum AddSetView {
    static let set: LocalizedStringKey = .init("set")
    static let insertName: LocalizedStringKey = .init("insert-name")
    static let color: LocalizedStringKey = .init("color")
    static let emojisList: LocalizedStringKey = .init("emojis-list")
    static let addEmoji: LocalizedStringKey = .init("add-emoji")
    static let addSet: LocalizedStringKey = .init("add-set")
    static let editSet: LocalizedStringKey = .init("edit-set")
    static let cancel: LocalizedStringKey = .init("cancel")
    static let save: LocalizedStringKey = .init("save")

    static func pairsCount(_ value: Int) -> LocalizedStringKey {
      LocalizedStringKey("pairs-count \(value)")
    }
  }

  enum GameView {
    static let restart: LocalizedStringKey = .init("restart")
    // swiftlint:disable:next identifier_name
    static let ok: LocalizedStringKey = .init("ok")
    static let newGame: LocalizedStringKey = .init("new-game")

    static func score(_ value: Int) -> LocalizedStringKey {
      LocalizedStringKey("score \(value)")
    }

    static func congratulations(_ value: Int) -> LocalizedStringKey {
      LocalizedStringKey("congratulations \(value)")
    }
  }
}
