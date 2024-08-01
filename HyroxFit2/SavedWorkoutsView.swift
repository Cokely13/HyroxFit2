//
//  SavedWorkoutsView.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/25/24.
//
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
                NavigationLink(destination: EnterResultsView(workout: workout)) {
                    VStack(alignment: .leading) {
                        Text(workout.name)
                            .font(.headline)
                        Text("Created By: \(workout.username)")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        Text("Exercise: \(workout.exercise)")
                        Text("Distance: \(workout.distance) meters")
                        Text("Start Date: \(workout.startDate, formatter: dateFormatter)")
                        Text("End Date: \(workout.endDate, formatter: dateFormatter)")
                    }
                    .padding(.vertical, 5)
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

// Date formatter to format the date
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
