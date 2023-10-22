//
//  WorkoutListScreen.swift
//  Worx
//
//  Created by J. DeWeese on 10/14/23.
//

import SwiftUI
import SwiftData

struct WorkoutListScreen: View {
    
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Workout.workoutTitle, order: .forward) private var workouts: [Workout]
    @Query(sort: \Exercise.name, order: .forward) private var exercises: [Exercise]
    
    @State private var exerciseName: String = ""
    @State private var isAddWorkoutPresented: Bool = false
    @State private var isExercisePresented: Bool = false
    
    
    func saveExercise() {
        let exercise = Exercise(name: exerciseName)
        context.insert(exercise)
    }
    
    var body: some View {
        
        WorkoutListView(workouts: workouts)
            .navigationTitle("Workouts")
            .padding()
            .toolbar(content: {
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Workout") {
                        isAddWorkoutPresented = true
                    }
                }
            })
            .sheet(isPresented: $isAddWorkoutPresented, content: {
                NavigationStack {
                    AddWorkoutScreen()
                }
            })
        
        }
    }
#Preview {
    NavigationStack {
        WorkoutListScreen()
            .modelContainer(for: [Workout.self, Review.self, Exercise.self])
    }
}
