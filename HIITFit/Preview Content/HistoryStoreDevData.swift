//
//  HistoryStoreDevData.swift
//  HIITFit
//
//  Created by Jenn Lee on 2/11/25.
//

import Foundation

extension HistoryStore {
    func createDevData() {
        exerciseDays = [
            ExerciseDay(date: Date().addingTimeInterval(-86400),
            exercises: [
                Exercise.exercises[0].exerciseName,
                Exercise.exercises[1].exerciseName,
                Exercise.exercises[2].exerciseName
            ]),
            ExerciseDay(date: Date().addingTimeInterval(-86400 * 2),
            exercises: [
                Exercise.exercises[1].exerciseName,
                Exercise.exercises[0].exerciseName
            ])
        ]
    }
}
