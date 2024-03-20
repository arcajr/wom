//
//  WOMApp.swift
//  WOM
//
//  Created by Argenis Cabello on 18-03-24.
//
import SwiftUI

@main
struct WOMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(FavoritesManager())
        }
    }
}
