//
//  New.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 8/5/24.
//

import Foundation
import SwiftUI

struct NEW: View {
    @EnvironmentObject var authState: AuthState

    var body: some View {
        VStack {
            Text("NEW!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            Button(action: {
                // Navigate back to MainView
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = windowScene.windows.first {
                    window.rootViewController = UIHostingController(rootView: MainView().environmentObject(authState))
                    window.makeKeyAndVisible()
                }
            }) {
                Text("Home")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct NEW_Previews: PreviewProvider {
    static var previews: some View {
        NEW()
            .environmentObject(AuthState())
    }
}
