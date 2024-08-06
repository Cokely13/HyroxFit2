//import SwiftUI
//
//struct NEW: View {
//    @EnvironmentObject var authState: AuthState
//    @Binding var workouts: [Workout] // Use a binding to modify the shared workouts array
//    var workout: Workout
//
//    // State for entering result
//    @State private var hours: Int = 0
//    @State private var minutes: Int = 0
//    @State private var seconds: Int = 0
//
//    var body: some View {
//        VStack {
//            Text("NEW!")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .padding()
//
//            // Display workout details
//            Text("Workout: \(workout.name)")
//                .font(.headline)
//            Text("Exercise: \(workout.exercise)")
//            Text("Distance: \(workout.distance) meters")
//
//            // Result entry fields
//            HStack {
//                TextField("Hours", value: $hours, formatter: NumberFormatter())
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(width: 60)
//                TextField("Minutes", value: $minutes, formatter: NumberFormatter())
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(width: 60)
//                TextField("Seconds", value: $seconds, formatter: NumberFormatter())
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(width: 60)
//            }
//            .padding()
//
//            Button(action: {
//                // Save the result
//                saveResult()
//
//                // Navigate back to MainView
//                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                   let window = windowScene.windows.first {
//                    window.rootViewController = UIHostingController(rootView: MainView().environmentObject(authState))
//                    window.makeKeyAndVisible()
//                }
//            }) {
//                Text("Enter Result")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.green)
//                    .cornerRadius(10)
//            }
//            .padding()
//        }
//    }
//
//    // Save the result to the workout
//    private func saveResult() {
//        let newResult = Result(
//            time: Time(hours: hours, minutes: minutes, seconds: seconds),
//            username: authState.username ?? "Unknown",
//            date: Date()
//        )
//
//        // Update the workout's results
//        if let index = workouts.firstIndex(where: { $0.id == workout.id }) {
//            workouts[index].results.append(newResult)
//            if let encodedWorkouts = try? JSONEncoder().encode(workouts) {
//                UserDefaults.standard.set(encodedWorkouts, forKey: "savedWorkouts")
//            }
//        }
//    }
//}
//
//struct NEW_Previews: PreviewProvider {
//    static var previews: some View {
//        NEW(
//            workouts: .constant([Workout(
//                id: UUID(),
//                name: "Sample Workout",
//                exercise: "Run",
//                distance: 5000,
//                username: "SampleUser",
//                startDate: Date(),
//                endDate: Date().addingTimeInterval(3600)
//            )]),
//            workout: Workout(
//                id: UUID(),
//                name: "Sample Workout",
//                exercise: "Run",
//                distance: 5000,
//                username: "SampleUser",
//                startDate: Date(),
//                endDate: Date().addingTimeInterval(3600)
//            )
//        )
//        .environmentObject(AuthState())
//    }
//}
//

import SwiftUI

struct NEW: View {
    @EnvironmentObject var authState: AuthState
    @Binding var workouts: [Workout]
    var workout: Workout

    // State for entering result
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0

    // State to manage navigation
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("NEW!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            // Display workout details
            Text("Workout: \(workout.name)")
                .font(.headline)
            Text("Exercise: \(workout.exercise)")
            Text("Distance: \(workout.distance) meters")

            // Result entry fields
            HStack {
                TextField("Hours", value: $hours, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 60)
                TextField("Minutes", value: $minutes, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 60)
                TextField("Seconds", value: $seconds, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 60)
            }
            .padding()

            Button(action: {
                // Save the result
                saveResult()

                // Navigate back to MainView using dismiss
                dismiss()
            }) {
                Text("Enter Result")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
        }
    }

    // Save the result to the workout
    private func saveResult() {
        let newResult = Result(
            time: Time(hours: hours, minutes: minutes, seconds: seconds),
            username: authState.username ?? "Unknown",
            date: Date()
        )

        // Update the workout's results
        if let index = workouts.firstIndex(where: { $0.id == workout.id }) {
            workouts[index].results.append(newResult)
            if let encodedWorkouts = try? JSONEncoder().encode(workouts) {
                UserDefaults.standard.set(encodedWorkouts, forKey: "savedWorkouts")
            }
        }
    }
}

struct NEW_Previews: PreviewProvider {
    static var previews: some View {
        NEW(
            workouts: .constant([Workout(
                id: UUID(),
                name: "Sample Workout",
                exercise: "Run",
                distance: 5000,
                username: "SampleUser",
                startDate: Date(),
                endDate: Date().addingTimeInterval(3600)
            )]),
            workout: Workout(
                id: UUID(),
                name: "Sample Workout",
                exercise: "Run",
                distance: 5000,
                username: "SampleUser",
                startDate: Date(),
                endDate: Date().addingTimeInterval(3600)
            )
        )
        .environmentObject(AuthState())
    }
}
