//
//  SavedWorkoutsView.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/25/24.
//

import Foundation
import SwiftUI

struct SavedWorkoutsView: View {
    @State private var workouts: [Workout] = []

    var body: some View {
        VStack {
            Text("Saved Workouts")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            List(workouts) { workout in
                VStack(alignment: .leading) {
                    Text(workout.name)
                        .font(.headline)
                    Text("Exercise: \(workout.exercise)")
                    Text("Distance: \(workout.distance) meters")
                }
            }
        }
        .onAppear(perform: loadWorkouts)
        .padding()
    }

    func loadWorkouts() {
        if let savedWorkoutsData = UserDefaults.standard.data(forKey: "savedWorkouts"),
           let savedWorkouts = try? JSONDecoder().decode([Workout].self, from: savedWorkoutsData) {
            workouts = savedWorkouts
        }
    }
}

struct SavedWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        SavedWorkoutsView()
    }
}
