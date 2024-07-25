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
    var results: [Result] = []
}

struct Result: Codable, Identifiable {
    var id: UUID
    var time: Time
}

struct Time: Codable {
    var hours: Int
    var minutes: Int
    var seconds: Int
}
