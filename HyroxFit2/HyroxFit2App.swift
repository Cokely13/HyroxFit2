//
//  HyroxFit2App.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/2/24.
//

//import SwiftUI
//
//@main
//struct HyroxFit2App: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

//import Foundation
//import SwiftUI
//
//@main
//struct HyroxFit2App: App {
//    @StateObject var authState = AuthState()
//    @StateObject var userData = UserData()
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environmentObject(authState)
//                .environmentObject(userData)
//        }
//    }
//}

//import SwiftUI
//
//@main
//struct HyroxFit2App: App {
//    @StateObject var authState = AuthState()
//    @StateObject var userData = UserData()
//
//    var body: some Scene {
//        WindowGroup {
//            NavigationStack {
//                if authState.isAuthenticated {
//                    MainView()
//                        .navigationDestination(for: ViewIdentifier.self) { viewIdentifier in
//                            switch viewIdentifier {
//                            case .createWorkout:
//                                CreateWorkout()
//                            case .savedWorkouts:
//                                SavedWorkoutsView()
//                            case .results:
//                                ResultsView()
//                            case .records:
//                                RecordsView()
//                            case .users:
//                                UsersView()
//                            case .resultConfirmation:
//                                ResultConfirmationView()
//                            case .main:
//                                MainView()
//                            }
//                        }
//                } else {
//                    LoginView()
//                }
//            }
//            .environmentObject(authState)
//            .environmentObject(userData)
//        }
//    }
//}
//
//enum ViewIdentifier: Hashable {
//    case createWorkout
//    case savedWorkouts
//    case results
//    case records
//    case users
//    case resultConfirmation
//    case main // Ensure every case is covered
//}

//import SwiftUI
//
//@main
//struct HyroxFit2App: App {
//    @StateObject var authState = AuthState()
//    @StateObject var userData = UserData()
//
//    var body: some Scene {
//        WindowGroup {
//            NavigationStack {
//                if authState.isAuthenticated {
//                    MainView()
//                        .navigationDestination(for: ViewIdentifier.self) { viewIdentifier in
//                            switch viewIdentifier {
//                            case .createWorkout:
//                                CreateWorkout()
//                            case .savedWorkouts:
//                                SavedWorkoutsView()
//                            case .results:
//                                ResultsView()
//                            case .records:
//                                RecordsView()
//                            case .users:
//                                UsersView()
//                            case .resultConfirmation:
//                                ResultConfirmationView() // Handle the ResultConfirmationView
//                            case .main:
//                                MainView()
//                            }
//                        }
//                } else {
//                    LoginView()
//                }
//            }
//            .environmentObject(authState)
//            .environmentObject(userData)
//        }
//    }
//}
//
//enum ViewIdentifier: Hashable {
//    case createWorkout
//    case savedWorkouts
//    case results
//    case records
//    case users
//    case resultConfirmation
//    case main
//}

import SwiftUI

@main
struct HyroxFit2App: App {
    @StateObject var authState = AuthState()
    @StateObject var userData = UserData()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if authState.isAuthenticated {
                    MainView()
                        .navigationDestination(for: ViewIdentifier.self) { viewIdentifier in
                            switch viewIdentifier {
                            case .createWorkout:
                                CreateWorkout()
                            case .savedWorkouts:
                                SavedWorkoutsView()
                            case .results:
                                ResultsView()
                            case .records:
                                RecordsView()
                            case .users:
                                UsersView()
                            case .resultConfirmation:
                                ResultConfirmationView()
                            case .main:
                                MainView()
                            }
                        }
                } else {
                    LoginView()
                }
            }
            .environmentObject(authState)
            .environmentObject(userData)
        }
    }
}

enum ViewIdentifier: Hashable {
    case createWorkout
    case savedWorkouts
    case results
    case records
    case users
    case resultConfirmation
    case main // Ensure every case is covered
}
