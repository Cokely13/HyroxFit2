//
//  AuthState.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/30/24.
//

import Foundation
import Combine

class AuthState: ObservableObject {
    @Published var isAuthenticated: Bool = false
}
