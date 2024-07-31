////
////  LoginView.swift
////  HyroxFit2
////
////  Created by Ryan Cokely on 7/30/24.
////
//
import Foundation
import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding(.bottom, 20)

            NavigationLink(destination: EnterCredentialsView()) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)

            NavigationLink(destination: CreateUserView()) {
                Text("Create New User")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthState())
            .environmentObject(UserData())
    }
}
