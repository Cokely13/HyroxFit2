//
//  App.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/30/24.
//

import Foundation
import SwiftUI

@main
struct HyroxFit2App: App {
    @StateObject var authState = AuthState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authState)
        }
    }
}
