import Foundation
import SwiftUI

struct CreateUserView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authState: AuthState
    @EnvironmentObject var userData: UserData

    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        VStack {
            Text("Create New User")
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

            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.bottom, 20)

            Button(action: createUser) {
                Text("Create User")
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

    func createUser() {
        guard !username.isEmpty else {
            alertMessage = "Username cannot be empty."
            showAlert = true
            return
        }
        
        guard !password.isEmpty else {
            alertMessage = "Password cannot be empty."
            showAlert = true
            return
        }

        guard password == confirmPassword else {
            alertMessage = "Passwords do not match."
            showAlert = true
            return
        }

        userData.addUser(username: username)
        authState.isAuthenticated = true
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
            .environmentObject(AuthState())
            .environmentObject(UserData())
    }
}

