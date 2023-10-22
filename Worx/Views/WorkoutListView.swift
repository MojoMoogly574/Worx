//
//  WorkoutListView.swift
//  Worx
//
//  Created by J. DeWeese on 10/14/23.
//

import SwiftUI
import SwiftData

struct WorkoutListView: View {
    
    let workouts: [Workout]
    @Environment(\.modelContext) private var context
    
    
    private func deleteWorkout(indexSet: IndexSet) {
        
        indexSet.forEach { index in
            let workout = workouts[index]
            context.delete(workout)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    var body: some View {
        List {
            ForEach(workouts) { workout in
                NavigationLink(value: workout) {
                    HStack {
                        Text(workout.workoutTitle)
                        Spacer()
                        Text(workout.workoutDescription)
                        Text(workout.workoutType)
                    }
                }
            }.onDelete(perform: deleteWorkout)
        }.navigationDestination(for: Workout.self) { workout in
            WorkoutDetailScreen(workout: workout)
        }
    }
}

#Preview {
    WorkoutListView(workouts: [])
        .modelContainer(for: [Workout.self])
}
