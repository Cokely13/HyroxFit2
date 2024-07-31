//
//  MainView.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/30/24.
//

import Foundation
import SwiftUI

struct MainView: View {
    @EnvironmentObject var authState: AuthState

    var body: some View {
        VStack {
            NavigationLink(destination: CreateWorkout()) {
                Text("Create a New Workout")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()

            NavigationLink(destination: SavedWorkoutsView()) {
                Text("View Saved Workouts")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()

            NavigationLink(destination: ResultsView()) {
                Text("View Results")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding()

            NavigationLink(destination: RecordsView()) {
                Text("View Records")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
            }
            .padding()

            NavigationLink(destination: UsersView()) {
                Text("View Users")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            .padding()

            Button(action: {
                authState.isAuthenticated = false
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
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AuthState())
            .environmentObject(UserData())
    }
}
