//
//  WorkoutDetailScreen.swift
//  Worx
//
//  Created by J. DeWeese on 10/14/23.
//

import SwiftUI
import SwiftData

struct WorkoutDetailScreen: View {
    
    @Environment(\.modelContext) private var context
    let workout: Workout
    
    @State private var workoutTitle: String = ""
    @State private var workoutDescription: String=""
    @State private var workoutType: String=""
    @State private var showReviewScreen: Bool = false
    
    var body: some View {
        Form {
            TextField("Title", text: $workoutTitle)
            TextField("Workout Description", text: $workoutDescription)
            TextField("Workout Type", text: $workoutType)
            Button("Update") {
                
                workout.workoutTitle = workoutTitle
                workout.workoutDescription = workoutDescription
                workout.workoutType = workoutType
                
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
                
            }.buttonStyle(.borderless)
            
            
            Section("Reviews") {
                Button(action: {
                    showReviewScreen = true
                }, label: {
                    Image(systemName: "plus")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                })
                
                if workout.reviews.isEmpty {
                    ContentUnavailableView {
                        Text("No reviews")
                    }
                } else {
                    ReviewListView(workout: workout)
                }
            }
            
            Section("Exercises") {
                
                if workout.exercises.isEmpty {
                    ContentUnavailableView {
                        Text("No exercises available.")
                    }
                } else {
                    List(workout.exercises) { exercise in
                        ExerciseCellView(exercise: exercise)
                    }
                }
            }
            
            
        }.onAppear {
            workoutTitle = workout.workoutTitle
            workoutDescription = workoutDescription
            workoutType = workoutType
            
        }
        .sheet(isPresented: $showReviewScreen, content: {
            NavigationStack {
                AddReviewScreen(workout: workout)
            }
        })
    }
}
    
    struct WorkoutDetailContainerScreen: View {
        
        @Environment(\.modelContext) private var context
        @State private var workout: Workout?
        
        var body: some View {
            ZStack {
                if let workout {
                    WorkoutDetailScreen(workout: workout)
                }
            }
            .onAppear {
                workout = Workout(workoutTitle: "test", workoutDescription: "gfgfhfghfhf", workoutType: "HIIT", reviews: [], exercises: [])
                context.insert(workout!)
            }
        }
    }

#Preview {
    WorkoutDetailContainerScreen()
        .modelContainer(for: [Workout.self])
}
