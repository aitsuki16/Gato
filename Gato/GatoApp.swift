//
//  GatoApp.swift
//  Gato
//
//  Created by Ai on 2022/10/21.
//

import SwiftUI
import Combine

@main
struct App: SwiftUI.App {
    @StateObject private var authModelSignOut = AuthModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject var authModel: AuthModel = AuthModel()
    
    var body: some Scene {
        WindowGroup{
            ContentView()
                .environmentObject(authModel)
        }
    }
}
