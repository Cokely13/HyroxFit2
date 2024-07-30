//import Foundation
//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
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
//                NavigationLink(destination: SavedWorkoutsView()) {
//                    Text("View Saved Workouts")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.green)
//                        .cornerRadius(10)
//                }
//                .padding()
//
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
//                NavigationLink(destination: RecordsView()) {
//                    Text("View Records")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.purple)
//                        .cornerRadius(10)
//                }
//                .padding()
//            }
//            .navigationTitle("HyroxFit2")
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authState: AuthState

    var body: some View {
        NavigationView {
            if authState.isAuthenticated {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthState())
    }
}
