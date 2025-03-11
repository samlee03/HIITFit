//
//  HIITFitApp.swift
//  HIITFit
//
//  Created by Jenn Lee on 2/4/25.
//

import SwiftUI

@main
struct HIITFitApp: App {
    @StateObject private var historyStore = HistoryStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(historyStore)
        }
    }
}
