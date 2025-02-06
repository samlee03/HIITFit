//
//  ExerciseView.swift
//  HIITFit
//
//  Created by Jenn Lee on 2/4/25.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    let index: Int
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    var interval: TimeInterval = 30
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(exerciseName: exercise.exerciseName)
                    .padding(.bottom)
                if let url = Bundle.main.url(forResource: exercise.videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url)).frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(exercise.videoName).mp4").foregroundColor(.red)
                }
                Text(Date().addingTimeInterval(interval), style: .timer).font(.system(size: geometry.size.height * 0.07))
                Button("Start/Done") { }
                    .font(.title3)
                    .padding()
                RatingView()
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
        ExerciseView(index: 0)
    }
}


