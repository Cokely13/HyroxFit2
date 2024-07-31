//
//  EnterCredentialsView.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/31/24.
//

import Foundation
import SwiftUI

struct EnterCredentialsView: View {
    @EnvironmentObject var authState: AuthState
    @EnvironmentObject var userData: UserData

    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        VStack {
            Text("Enter Credentials")
                .font(.largeTitle)
                .padding(.bottom, 20)

            TextField("Enter Username", text: $username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.bottom, 20)

            SecureField("Enter Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.bottom, 20)

            Button(action: loginUser) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
    }

    func loginUser() {
        guard let user = userData.users.first(where: { $0.username == username }) else {
            alertMessage = "User not found."
            showAlert = true
            return
        }

        // This is a placeholder password check
        // Replace with your actual password verification logic
        if password == "password" { // Replace with actual password checking
            authState.username = username
            authState.isAuthenticated = true
        } else {
            alertMessage = "Incorrect password."
            showAlert = true
        }
    }
}

struct EnterCredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        EnterCredentialsView()
            .environmentObject(AuthState())
            .environmentObject(UserData())
    }
}

