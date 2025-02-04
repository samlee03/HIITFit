//
//  ContentView.swift
//  HIITFit
//
//  Created by Jenn Lee on 2/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomeView()
            ExerciseView(index: 0)
            ForEach(0 ..< 4){ index in
                ExerciseView(index: index)
            }
            Text("Exercise 2")
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
