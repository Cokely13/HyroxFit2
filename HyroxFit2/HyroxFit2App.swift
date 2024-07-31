//
//  HyroxFit2App.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/2/24.
//

//import SwiftUI
//
//@main
//struct HyroxFit2App: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

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
