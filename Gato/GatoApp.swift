//
//  GatoApp.swift
//  Gato
//
//  Created by Ai on 2022/10/21.
//

import SwiftUI
@main
struct App: SwiftUI.App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
    WindowGroup(content: ContentView.init)
  }
}


