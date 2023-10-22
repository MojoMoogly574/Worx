//
//  ExerciseSelectionView.swift
//  Worx
//
//  Created by J. DeWeese on 10/14/23.
//

import SwiftUI
import SwiftData

struct ExerciseSelectionView: View {
    
    @Query(sort: \Exercise.name, order: .forward) private var exercises: [Exercise]
    @Binding var selectedExercises: Set<Exercise>
    
    var body: some View {
        List(exercises) { exercise in
            HStack {
                Image(systemName: selectedExercises.contains(exercise) ? "checkmark.square": "square")
                    .onTapGesture {
                        if !selectedExercises.contains(exercise) {
                            selectedExercises.insert(exercise)
                        } else {
                            selectedExercises.remove(exercise)
                        }
                    }
                Text(exercise.name)
            }
        }
    }
}

/*
#Preview {
    ActorSelectionView()
} */
