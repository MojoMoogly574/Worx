//
//  ExerciseCellView.swift
//  Worx
//
//  Created by J. DeWeese on 10/14/23.
//

import SwiftUI

struct ExerciseCellView: View {
    
    let exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(exercise.name)
            Text(exercise.workouts.map { $0.workoutTitle }, format: .list(type: .and))
                .font(.caption)
        }
    }
}

