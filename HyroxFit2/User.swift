////
////  User.swift
////  HyroxFit2
////
////  Created by Ryan Cokely on 7/31/24.
////
//
//import Foundation
//
//struct User: Identifiable, Codable {
//    var id = UUID()
//    var username: String
//    var password: String
//}
//
//class UserData: ObservableObject {
//    @Published var users: [User] = []
//
//    init() {
//        loadUsers()
//    }
//
//    func addUser(username: String, password: String) {
//        let newUser = User(username: username, password: password)
//        users.append(newUser)
//        saveUsers()
//    }
//
//    func authenticate(username: String, password: String) -> Bool {
//        if let user = users.first(where: { $0.username == username && $0.password == password }) {
//            return true
//        }
//        return false
//    }
//
//    private func saveUsers() {
//        if let encoded = try? JSONEncoder().encode(users) {
//            UserDefaults.standard.set(encoded, forKey: "users")
//        }
//    }
//
//    private func loadUsers() {
//        if let savedUsers = UserDefaults.standard.data(forKey: "users"),
//           let decodedUsers = try? JSONDecoder().decode([User].self, from: savedUsers) {
//            users = decodedUsers
//        }
//    }
//}
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    var username: String
    var password: String
}

class UserData: ObservableObject {
    @Published var users: [User] = []

    init() {
        loadUsers()
    }

    func addUser(username: String, password: String) {
        let newUser = User(username: username, password: password)
        users.append(newUser)
        saveUsers()
    }

    func authenticate(username: String, password: String) -> Bool {
        // Simplified authentication logic to eliminate unused 'user' variable
        return users.contains(where: { $0.username == username && $0.password == password })
    }

    private func saveUsers() {
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: "users")
        }
    }

    private func loadUsers() {
        if let savedUsers = UserDefaults.standard.data(forKey: "users"),
           let decodedUsers = try? JSONDecoder().decode([User].self, from: savedUsers) {
            users = decodedUsers
        }
    }
}
