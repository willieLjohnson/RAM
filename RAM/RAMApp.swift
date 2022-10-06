//
//  RAMApp.swift
//  RAM
//
//  Created by Willie Liwa Johnson on 10/1/22.
//

import SwiftUI

@main
struct RAMApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(GameViewModel(ImageSets().getRandom()))
    }
  }
}
