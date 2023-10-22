//
//  ExerciseListView.swift
//  Worx
//
//  Created by J. DeWeese on 10/14/23.
//

import SwiftUI

struct ExerciseListView: View {
    
    let exercises: [Exercise]
    
    var body: some View {
        List(exercises) { exercise in
            Text(exercise.name)
        }
    }
}

#Preview {
    ExerciseListView(exercises: [])
}
