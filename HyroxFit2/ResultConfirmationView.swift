import Foundation
import SwiftUI

struct ResultConfirmationView: View {
    @EnvironmentObject var authState: AuthState // Ensure environment object is used

    var body: some View {
        VStack {
            Text("You've Entered a Result!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)
                .padding(.bottom, 20)

            NavigationLink(value: ViewIdentifier.main) {
                Text("Go to Homepage")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)

            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true) // Hide the back button
    }
}

struct ResultConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ResultConfirmationView()
            .environmentObject(AuthState())
    }
}

