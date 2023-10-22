//
//  ReviewListView.swift
//  Worx
//
//  Created by J. DeWeese on 10/14/23.
//



import SwiftUI

struct ReviewListView: View {
    
    @Environment(\.modelContext) private var context
    let workout: Workout
    
    private func deleteReview(indexSet: IndexSet) {
        indexSet.forEach { index in
            let review = workout.reviews[index]
            context.delete(review)
            
            do {
                workout.reviews.remove(at: index)
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(workout.reviews) { review in
                VStack(alignment: .leading) {
                    Text(review.subject)
                    Text(review.body)
                }
            }.onDelete(perform: deleteReview)
        }
    }
}

/*
#Preview {
    ReviewListView(reviews: [])
        .modelContainer(for: [Review.self, Movie.self])
} */
