//
//  AddWorkoutScreen.swift
//  Worx
//
//  Created by J. DeWeese on 10/14/23.
//

import SwiftUI
import SwiftData

struct AddWorkoutScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext)private var context
    
    @Query(sort: \Exercise.name, order: .forward) private var exercises: [Exercise]
    
    @State private var workoutTitle: String = ""
    @State private var workoutDescription: String = ""
    @State private var workoutType: String = ""
    
    @State private var exerciseName: String = ""
    
    private func saveExercise() {
        let exercise = Exercise(name: exerciseName)
        context.insert(exercise)
    }
    
    private var isFormValid: Bool {
        !workoutTitle.isEmptyOrWhiteSpace && !exerciseName.isEmpty
    }
    
    var body: some View {
        List {
            TextField("Title", text: $workoutTitle)
            TextField("Workout Description", text: $workoutDescription)
            TextField("Workout Type", text: $workoutType)
           
            
            Section(header: Text("Select Exercises")) {
                Text("Add Exercise")
                    .font(.largeTitle)
                
                TextField("Exercise name", text: $exerciseName)
                    .textFieldStyle(.roundedBorder)
                    .presentationDetents([.fraction(0.25)])
                    .padding()
                
                Button {
                    saveExercise()
                } label: {
                    
                }
                ExerciseListView(exercises: exercises)
            }
            
        }
        .navigationTitle("Add Workout")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    
                    
                    let workout = Workout(workoutTitle: workoutTitle, workoutDescription: workoutDescription, workoutType: workoutType, reviews: [], exercises: [])
                    workout.exercises = Array(exercises)
                
                    exercises.forEach { exercise in
                        exercise.workouts.append(workout)
                        context.insert(exercise)
                    }
                    
                    context.insert(workout)
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    dismiss()
                    
                }.disabled(!isFormValid)
            }
        }
    }
}
#Preview {
    NavigationStack {
        AddWorkoutScreen()
            .modelContainer(for: [Workout.self])
    }
}

