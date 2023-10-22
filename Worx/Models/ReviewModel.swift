//
//  WorkoutHistoryModel.swift
//  Worx
//
//  Created by J. DeWeese on 10/14/23.
//

import Foundation
import SwiftData

@Model
final class Review {
    var subject: String
    var body: String
    var workout: Workout?
    
    init(subject: String, body: String) {
        self.subject = subject
        self.body = body
    }
}
