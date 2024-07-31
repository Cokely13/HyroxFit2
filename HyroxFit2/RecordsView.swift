import Foundation
import SwiftUI

struct RecordsView: View {
    @State private var workouts: [Workout] = []

    var body: some View {
        VStack {
            Text("Workout Records")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            List {
                ForEach(workouts) { workout in
                    if let record = workout.results.min(by: { $0.time.totalSeconds < $1.time.totalSeconds }) {
                        Section(header: Text(workout.name).font(.headline)) {
                            VStack(alignment: .leading) {
                                Text("User: \(record.username)")
                                Text("Exercise: \(workout.exercise)")
                                Text("Distance: \(workout.distance) meters")
                                Text("Fastest Time: \(record.time.hours)h \(record.time.minutes)m \(record.time.seconds)s")
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



struct RecordsView_Previews: PreviewProvider {
    static var previews: some View {
        RecordsView()
    }
}

