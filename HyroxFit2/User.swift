//
//  User.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/31/24.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    var username: String
}

class UserData: ObservableObject {
    @Published var users: [User] = []

    init() {
        loadUsers()
    }

    func addUser(username: String) {
        let newUser = User(username: username)
        users.append(newUser)
        saveUsers()
    }

    func saveUsers() {
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: "users")
        }
    }

    func loadUsers() {
        if let savedUsers = UserDefaults.standard.data(forKey: "users"),
           let decodedUsers = try? JSONDecoder().decode([User].self, from: savedUsers) {
            users = decodedUsers
        }
    }
}

