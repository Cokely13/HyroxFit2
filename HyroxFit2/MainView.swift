//import SwiftUI
//
//struct MainView: View {
//    @EnvironmentObject var authState: AuthState
//
//    var body: some View {
//        VStack {
//            if let username = authState.username {
//                Text("Welcome, \(username)")
//                    .font(.largeTitle)
//                    .padding(.bottom, 20)
//            }
//
//            NavigationLink(destination: CreateWorkout()) {
//                Text("Create a New Workout")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue)
//                    .cornerRadius(10)
//            }
//            .padding()
//
//            NavigationLink(destination: SavedWorkoutsView()) {
//                Text("View Saved Workouts")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.green)
//                    .cornerRadius(10)
//            }
//            .padding()
//
//            NavigationLink(destination: ResultsView()) {
//                Text("View Results")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.orange)
//                    .cornerRadius(10)
//            }
//            .padding()
//
//            NavigationLink(destination: RecordsView()) {
//                Text("View Records")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.purple)
//                    .cornerRadius(10)
//            }
//            .padding()
//
//            NavigationLink(destination: UsersView()) {
//                Text("View Users")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.gray)
//                    .cornerRadius(10)
//            }
//            .padding()
//
//            Button(action: {
//                authState.isAuthenticated = false
//                authState.username = nil
//            }) {
//                Text("Logout")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.red)
//                    .cornerRadius(10)
//            }
//            .padding(.top, 20)
//            .navigationBarBackButtonHidden(true) // Hide the back button
//        }
//        .navigationTitle("HyroxFit2")
//        .navigationBarBackButtonHidden(true) // Ensure back button is hidden in MainView
//    }
//}
//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//            .environmentObject(AuthState())
//            .environmentObject(UserData())
//    }
//}
//import SwiftUI
//
//struct MainView: View {
//    @EnvironmentObject var authState: AuthState
//    @State private var workouts: [Workout] = []
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                // Your MainView content...
//
//                NavigationLink(destination: NEW(workouts: $workouts, workout: workouts.first!).environmentObject(authState)) {
//                    Text("Start New Workout")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                // Other buttons and links...
//            }
//            .navigationTitle("Main")
//        }
//    }
//}
//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//            .environmentObject(AuthState())
//    }
////}
//
//import SwiftUI
//
//struct MainView: View {
//    @EnvironmentObject var authState: AuthState
//    @State private var workouts: [Workout] = []
//
//    var body: some View {
//        NavigationStack {
//            VStack {
//                // Welcome message
//                if let username = authState.username {
//                    Text("Welcome, \(username)")
//                        .font(.largeTitle)
//                        .padding(.bottom, 20)
//                }
//
//                // Create Workout Button
//                NavigationLink(destination: CreateWorkout()) {
//                    Text("Create a New Workout")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding()
//
//                // View Saved Workouts Button
//                NavigationLink(destination: SavedWorkoutsView().environmentObject(authState)) {
//                    Text("View Saved Workouts")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.green)
//                        .cornerRadius(10)
//                }
//                .padding()
//
//                // View Results Button
//                NavigationLink(destination: ResultsView()) {
//                    Text("View Results")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.orange)
//                        .cornerRadius(10)
//                }
//                .padding()
//
//                // View Records Button
//                NavigationLink(destination: RecordsView()) {
//                    Text("View Records")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.purple)
//                        .cornerRadius(10)
//                }
//                .padding()
//
//                // View Users Button
//                NavigationLink(destination: UsersView()) {
//                    Text("View Users")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.gray)
//                        .cornerRadius(10)
//                }
//                .padding()
//
//                // Start New Workout Button
//                if let firstWorkout = workouts.first {
//                    NavigationLink(destination: NEW(workouts: $workouts, workout: firstWorkout).environmentObject(authState)) {
//                        Text("Start New Workout")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
//                    .padding()
//                } else {
//                    Text("No Workouts Available")
//                        .font(.headline)
//                        .foregroundColor(.red)
//                        .padding()
//                }
//
//                // Logout Button
//                Button(action: {
//                    authState.isAuthenticated = false
//                    authState.username = nil
//                }) {
//                    Text("Logout")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.red)
//                        .cornerRadius(10)
//                }
//                .padding(.top, 20)
//            }
//            .navigationTitle("HyroxFit2")
//            .navigationBarBackButtonHidden(true) // Hide the back button
//        }
//    }
//}
//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//            .environmentObject(AuthState())
//            .environmentObject(UserData())
//    }
//}
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var authState: AuthState
    @State private var workouts: [Workout] = []

    var body: some View {
        NavigationStack {
            VStack {
                // Welcome message
                if let username = authState.username {
                    Text("Welcome, \(username)")
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                }

                // Create Workout Button
                NavigationLink(destination: CreateWorkout()) {
                    Text("Create a New Workout")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                // View Saved Workouts Button
                NavigationLink(destination: SavedWorkoutsView().environmentObject(authState)) {
                    Text("View Saved Workouts")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()

                // View Results Button
                NavigationLink(destination: ResultsView()) {
                    Text("View Results")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding()

                // View Records Button
                NavigationLink(destination: RecordsView()) {
                    Text("View Records")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                .padding()

                // View Users Button
                NavigationLink(destination: UsersView()) {
                    Text("View Users")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                .padding()

                // Start New Workout Button
                if let firstWorkout = workouts.first {
                    NavigationLink(destination: NEW(workouts: $workouts, workout: firstWorkout).environmentObject(authState)) {
                        Text("Start New Workout")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                } else {
                    Text("No Workouts Available")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }

                // Logout Button
                Button(action: {
                    authState.isAuthenticated = false
                    authState.username = nil
                }) {
                    Text("Logout")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .navigationTitle("HyroxFit2")
            .navigationBarBackButtonHidden(true) // Hide the back button
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AuthState())
            .environmentObject(UserData())
    }
}
