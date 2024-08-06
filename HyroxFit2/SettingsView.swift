//
//  SettingsView.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 8/6/24.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
            // Other settings UI elements...

            Button(action: {
                showAlert = true
            }) {
                Text("Clear All Data")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Clear All Data"),
                    message: Text("Are you sure you want to clear all data? This action cannot be undone."),
                    primaryButton: .destructive(Text("Clear")) {
                        clearAllData()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}

func clearAllData() {
    UserDefaults.standard.removeObject(forKey: "savedWorkouts")
    UserDefaults.standard.removeObject(forKey: "savedUsers")
    UserDefaults.standard.removeObject(forKey: "savedRecords")
    UserDefaults.standard.synchronize()
    print("All data has been cleared.")
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
