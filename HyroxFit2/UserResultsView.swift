//
//  UserResultsView.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/31/24.
//

import Foundation
import SwiftUI

struct UserResultsView: View {
    var username: String
    @State private var workouts: [Workout] = []

    var body: some View {
        VStack {
            Text("Results for \(username)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            List {
                ForEach(workouts) { workout in
                    let userResults = workout.results.filter { $0.username == username }
                    if !userResults.isEmpty {
                        Section(header: Text(workout.name).font(.headline)) {
                            ForEach(userResults) { result in
                                VStack(alignment: .leading) {
                                    Text("Exercise: \(workout.exercise)")
                                    Text("Distance: \(workout.distance) meters")
                                    Text("Time: \(result.time.hours)h \(result.time.minutes)m \(result.time.seconds)s")
                                }
                                .padding(.vertical, 5)
                            }
                        }
                    }
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

struct UserResultsView_Previews: PreviewProvider {
    static var previews: some View {
        UserResultsView(username: "TestUser")
    }
}
