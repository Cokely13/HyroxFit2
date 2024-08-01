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
    var startDate: Date // Add start date
    var endDate: Date // Add end date
    var results: [Result] = []
}

struct Result: Identifiable, Codable {
    var id = UUID()
    var time: Time
    var username: String
    var date: Date // Add date to track when the result was entered
}


struct Time: Codable {
    var hours: Int
    var minutes: Int
    var seconds: Int
}
