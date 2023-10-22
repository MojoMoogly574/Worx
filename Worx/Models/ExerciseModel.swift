//
//  ExerciseModel.swift
//  Worx
//
//  Created by J. DeWeese on 10/14/23.
//

import Foundation
import SwiftData

@Model
final class Exercise {
    
    var name: String
    var workouts: [Workout] = []
    
    init(name: String) {
        self.name = name
    }
}
