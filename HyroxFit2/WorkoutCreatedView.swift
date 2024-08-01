//
//  WorkoutCreatedView.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/25/24.
//

import Foundation
import SwiftUI

struct WorkoutCreatedView: View {
    var body: some View {
        VStack {
            Text("You Created a Workout!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            NavigationLink(destination: ContentView()) {
                Text("Go to Homepage")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true) // Hide the back button
    }
}

struct WorkoutCreatedView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCreatedView()
    }
}
