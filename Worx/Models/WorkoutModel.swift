//
//  WorkoutModel.swift
//  Worx
//
//  Created by J. DeWeese on 10/14/23.
//

import Foundation
import SwiftData

@Model
final class Workout {
    
    var workoutTitle: String
    var workoutDescription: String
    var workoutType: String
    
    @Relationship(deleteRule: .cascade, inverse: \Review.workout)
    var reviews: [Review] = []
    
    @Relationship(deleteRule: .noAction, inverse: \Exercise.workouts)
    var exercises: [Exercise] = []
    
    init(workoutTitle: String, workoutDescription: String, workoutType: String, reviews: [Review], exercises: [Exercise]) {
        self.workoutTitle = workoutTitle
        self.workoutDescription = workoutDescription
        self.workoutType = workoutType
        self.reviews = reviews
        self.exercises = exercises
    }
}
