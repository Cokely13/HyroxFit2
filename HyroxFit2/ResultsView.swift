import Foundation
import SwiftUI

struct ResultsView: View {
    @State private var workouts: [Workout] = []
    @State private var selectedWorkout: String = "All"

    var filteredWorkouts: [Workout] {
        if selectedWorkout == "All" {
            return workouts
        } else {
            return workouts.filter { $0.name == selectedWorkout }
        }
    }

    var body: some View {
        VStack {
            Text("Results")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            Picker("Select Workout", selection: $selectedWorkout) {
                Text("All").tag("All")
                ForEach(workouts.map { $0.name }, id: \.self) { workoutName in
                    Text(workoutName).tag(workoutName)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()

            List {
                ForEach(filteredWorkouts) { workout in
                    Section(header: Text(workout.name).font(.headline)) {
                        ForEach(workout.results.sorted(by: { $0.time.totalSeconds < $1.time.totalSeconds })) { result in
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

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}

