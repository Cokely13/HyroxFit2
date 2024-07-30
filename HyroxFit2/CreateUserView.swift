//
//  CreateUserView.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/30/24.
//

import Foundation
import SwiftUI

struct CreateUserView: View {
    var body: some View {
        VStack {
            Text("Create New User")
                .font(.largeTitle)
                .padding(.bottom, 20)

            // Add form fields here for username, password, etc.

            Button(action: {
                // Add logic to create a new user
            }) {
                Text("Create User")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
