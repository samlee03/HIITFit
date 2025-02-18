//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Jenn Lee on 2/4/25.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @State private var showSuccess = false
    @Binding var selectedTab: Int
    @State private var rating = 0
    let index: Int
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    var interval: TimeInterval = 30
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    var startButton: some View {
        Button("Start Exercise") { }
    }
    var doneButton: some View {
        Button("Done") {
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
        }
        .sheet(isPresented: $showSuccess){
            SuccessView(selectedTab: $selectedTab)
        }
    }
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: exercise.exerciseName)
                    .padding(.bottom)
                if let url = Bundle.main.url(forResource: exercise.videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url)).frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(exercise.videoName).mp4").foregroundColor(.red)
                }
                Text(Date().addingTimeInterval(interval), style: .timer).font(.system(size: geometry.size.height * 0.07))
                HStack (spacing: 150) {
                    startButton
                    doneButton
                }
                    .font(.title3)
                    .padding()
                RatingView(rating: $rating)
                    .padding()
                Spacer()
                Button("History") { }
                    .padding(.bottom)
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(3), index: 3)
    }
}


