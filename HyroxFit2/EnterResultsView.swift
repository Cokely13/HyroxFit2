////import Foundation
////import SwiftUI
////
////struct EnterResultsView: View {
////    var workout: Workout
////
////    @State private var hours: Int = 0
////    @State private var minutes: Int = 0
////    @State private var seconds: Int = 0
////    @State private var navigateToConfirmation: Bool = false
////
////    @Environment(\.presentationMode) var presentationMode
////    @EnvironmentObject var authState: AuthState
////
////    let digits = Array(0...59)
////
////    var body: some View {
////        VStack(alignment: .leading, spacing: 20) {
////            Text(workout.name)
////                .font(.largeTitle)
////                .fontWeight(.bold)
////                .padding(.top)
////
////            Text("Exercise: \(workout.exercise)")
////                .font(.headline)
////            Text("Distance: \(workout.distance) meters")
////                .font(.headline)
////
////            Text("Enter Time (HH:MM:SS)")
////                .font(.headline)
////
////            HStack {
////                Picker("Hours", selection: $hours) {
////                    ForEach(0..<24) { digit in
////                        Text("\(digit)").tag(digit)
////                    }
////                }
////                .pickerStyle(WheelPickerStyle())
////                .frame(width: 60, height: 150)
////
////                Picker("Minutes", selection: $minutes) {
////                    ForEach(digits, id: \.self) { digit in
////                        Text("\(digit)").tag(digit)
////                    }
////                }
////                .pickerStyle(WheelPickerStyle())
////                .frame(width: 60, height: 150)
////
////                Picker("Seconds", selection: $seconds) {
////                    ForEach(digits, id: \.self) { digit in
////                        Text("\(digit)").tag(digit)
////                    }
////                }
////                .pickerStyle(WheelPickerStyle())
////                .frame(width: 60, height: 150)
////            }
////
////            NavigationLink(destination: ResultConfirmationView(), isActive: $navigateToConfirmation) {
////                Button(action: {
////                    saveResult()
////                    navigateToConfirmation = true
////                }) {
////                    Text("Enter Results")
////                        .font(.headline)
////                        .foregroundColor(.white)
////                        .padding()
////                        .frame(maxWidth: .infinity)
////                        .background(Color.blue)
////                        .cornerRadius(10)
////                }
////            }
////            .padding(.top, 20)
////
////            Spacer()
////            Button(action: {
////                           // Navigate back to Home
////                           presentationMode.wrappedValue.dismiss()
////                       }) {
////                           Text("Home")
////                               .font(.headline)
////                               .foregroundColor(.white)
////                               .padding()
////                               .frame(maxWidth: .infinity)
////                               .background(Color.green)
////                               .cornerRadius(10)
////                       }
////                       .padding(.bottom, 20)
////                   
////        }
////        .padding()
//////        .navigationBarTitle("Enter Results", displayMode: .inline)
////    }
////
////    func saveResult() {
////        guard let username = authState.username else { return }
////
////        var savedWorkouts = loadWorkouts()
////
////        if let index = savedWorkouts.firstIndex(where: { $0.id == workout.id }) {
////            let newResult = Result(id: UUID(), time: Time(hours: hours, minutes: minutes, seconds: seconds), username: username)
////            savedWorkouts[index].results.append(newResult)
////            
////            if let encoded = try? JSONEncoder().encode(savedWorkouts) {
////                UserDefaults.standard.set(encoded, forKey: "savedWorkouts")
////            }
////        }
////    }
////    
////    func loadWorkouts() -> [Workout] {
////        if let savedWorkoutsData = UserDefaults.standard.data(forKey: "savedWorkouts"),
////           let savedWorkouts = try? JSONDecoder().decode([Workout].self, from: savedWorkoutsData) {
////            return savedWorkouts
////        }
////        return []
////    }
////}
////
////struct EnterResultsView_Previews: PreviewProvider {
////    static var previews: some View {
////        NavigationView {
////            EnterResultsView(workout: Workout(id: UUID(), name: "Test Workout", exercise: "Run", distance: 5000, username: "TestUser"))
////                .environmentObject(AuthState()) // Add this line to provide the authState object
////        }
////    }
////}
////
//
//import Foundation
//import SwiftUI
//
//struct EnterResultsView: View {
//    var workout: Workout
//
//    @State private var hours: Int = 0
//    @State private var minutes: Int = 0
//    @State private var seconds: Int = 0
//    @State private var navigateToConfirmation: Bool = false
//
//    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var authState: AuthState
//
//    let digits = Array(0...59)
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            Text(workout.name)
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .padding(.top)
//
//            Text("Exercise: \(workout.exercise)")
//                .font(.headline)
//            Text("Distance: \(workout.distance) meters")
//                .font(.headline)
//
//            Text("Enter Time (HH:MM:SS)")
//                .font(.headline)
//
//            HStack {
//                Picker("Hours", selection: $hours) {
//                    ForEach(0..<24) { digit in
//                        Text("\(digit)").tag(digit)
//                    }
//                }
//                .pickerStyle(WheelPickerStyle())
//                .frame(width: 60, height: 150)
//
//                Picker("Minutes", selection: $minutes) {
//                    ForEach(digits, id: \.self) { digit in
//                        Text("\(digit)").tag(digit)
//                    }
//                }
//                .pickerStyle(WheelPickerStyle())
//                .frame(width: 60, height: 150)
//
//                Picker("Seconds", selection: $seconds) {
//                    ForEach(digits, id: \.self) { digit in
//                        Text("\(digit)").tag(digit)
//                    }
//                }
//                .pickerStyle(WheelPickerStyle())
//                .frame(width: 60, height: 150)
//            }
//
//            NavigationLink(destination: ResultConfirmationView(), isActive: $navigateToConfirmation) {
//                Button(action: {
//                    saveResult()
//                    navigateToConfirmation = true
//                }) {
//                    Text("Enter Results")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//            }
//            .padding(.top, 20)
//
//            Spacer()
//
//            Button(action: {
//                // Navigate back to Home
//                presentationMode.wrappedValue.dismiss()
//            }) {
//                Text("Home")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color.green)
//                    .cornerRadius(10)
//            }
//            .padding(.bottom, 20)
//        }
//        .padding()
//        .navigationBarTitle("Enter Results", displayMode: .inline)
//    }
//
//    func saveResult() {
//        guard let username = authState.username else { return }
//
//        var savedWorkouts = loadWorkouts()
//
//        if let index = savedWorkouts.firstIndex(where: { $0.id == workout.id }) {
//            let newResult = Result(id: UUID(), time: Time(hours: hours, minutes: minutes, seconds: seconds), username: username, date: Date()) // Include the date
//            savedWorkouts[index].results.append(newResult)
//            
//            if let encoded = try? JSONEncoder().encode(savedWorkouts) {
//                UserDefaults.standard.set(encoded, forKey: "savedWorkouts")
//            }
//        }
//    }
//    
//    func loadWorkouts() -> [Workout] {
//        if let savedWorkoutsData = UserDefaults.standard.data(forKey: "savedWorkouts"),
//           let savedWorkouts = try? JSONDecoder().decode([Workout].self, from: savedWorkoutsData) {
//            return savedWorkouts
//        }
//        return []
//    }
//}
//
//struct EnterResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            EnterResultsView(workout: Workout(
//                id: UUID(),
//                name: "Test Workout",
//                exercise: "Run",
//                distance: 5000,
//                username: "TestUser",
//                startDate: Date(), // Add start date
//                endDate: Date()    // Add end date
//            ))
//            .environmentObject(AuthState()) // Add this line to provide the authState object
//        }
//    }
//}
//

import Foundation
import SwiftUI

struct EnterResultsView: View {
    var workout: Workout

    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    @State private var navigateToConfirmation: Bool = false

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authState: AuthState

    let digits = Array(0...59)

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(workout.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            Text("Exercise: \(workout.exercise)")
                .font(.headline)
            Text("Distance: \(workout.distance) meters")
                .font(.headline)

            Text("Enter Time (HH:MM:SS)")
                .font(.headline)

            HStack {
                Picker("Hours", selection: $hours) {
                    ForEach(0..<24) { digit in
                        Text("\(digit)").tag(digit)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 60, height: 150)

                Picker("Minutes", selection: $minutes) {
                    ForEach(digits, id: \.self) { digit in
                        Text("\(digit)").tag(digit)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 60, height: 150)

                Picker("Seconds", selection: $seconds) {
                    ForEach(digits, id: \.self) { digit in
                        Text("\(digit)").tag(digit)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 60, height: 150)
            }

            Button(action: {
                saveResult()
                navigateToConfirmation = true
            }) {
                Text("Enter Results")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)

            Spacer()

            Button(action: {
                // Navigate back to Home
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Home")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
        }
        .padding()
        .navigationBarTitle("Enter Results", displayMode: .inline)
        .navigationDestination(isPresented: $navigateToConfirmation) {
            ResultConfirmationView()
        }
    }

    func saveResult() {
        guard let username = authState.username else { return }

        var savedWorkouts = loadWorkouts()

        if let index = savedWorkouts.firstIndex(where: { $0.id == workout.id }) {
            let newResult = Result(id: UUID(), time: Time(hours: hours, minutes: minutes, seconds: seconds), username: username, date: Date()) // Include the date
            savedWorkouts[index].results.append(newResult)
            
            if let encoded = try? JSONEncoder().encode(savedWorkouts) {
                UserDefaults.standard.set(encoded, forKey: "savedWorkouts")
            }
        }
    }
    
    func loadWorkouts() -> [Workout] {
        if let savedWorkoutsData = UserDefaults.standard.data(forKey: "savedWorkouts"),
           let savedWorkouts = try? JSONDecoder().decode([Workout].self, from: savedWorkoutsData) {
            return savedWorkouts
        }
        return []
    }
}

struct EnterResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EnterResultsView(workout: Workout(
                id: UUID(),
                name: "Test Workout",
                exercise: "Run",
                distance: 5000,
                username: "TestUser",
                startDate: Date(), // Add start date
                endDate: Date()    // Add end date
            ))
            .environmentObject(AuthState()) // Add this line to provide the authState object
        }
    }
}

