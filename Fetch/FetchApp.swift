//
//  FetchApp.swift
//  Fetch
//
//  Created by Thomas TRUONG on 16/09/2022.
//

import SwiftUI

@main
struct FetchApp: App {
    // Source of truth for our mutable store
    @StateObject private var store = FoodStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
