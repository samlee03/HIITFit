//
//  ContentView.swift
//  HIITFit
//
//  Created by Jenn Lee on 2/4/25.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab = 9
    
    var body: some View {
        
        ZStack {
            GradientBackground()
            TabView (selection: $selectedTab) {
                WelcomeView(selectedTab: $selectedTab) // 1
                    .tag(9) // 2
                ForEach(Exercise.exercises.indices, id: \.self){ index in
                    ExerciseView(selectedTab: $selectedTab, index: index)
                        .tag(index) // 3
                }
                Text("Exercise 2")
            }
            .environmentObject(HistoryStore())
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
