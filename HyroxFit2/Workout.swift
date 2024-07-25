//
//  Workout.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/25/24.
//

import Foundation
import Foundation

struct Workout: Codable, Identifiable {
    var id: UUID
    var name: String
    var exercise: String
    var distance: Int
}
