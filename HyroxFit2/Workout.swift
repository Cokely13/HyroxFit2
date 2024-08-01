//
//  Workout.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/25/24.
//

import Foundation

struct Workout: Codable, Identifiable {
    var id: UUID
    var name: String
    var exercise: String
    var distance: Int
    var username: String
    var results: [Result] = []
}

struct Result: Identifiable, Codable {
    var id = UUID()
    var time: Time
    var username: String // Add this field to store the username
}


struct Time: Codable {
    var hours: Int
    var minutes: Int
    var seconds: Int
}
