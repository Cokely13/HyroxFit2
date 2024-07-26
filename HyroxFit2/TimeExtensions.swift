//
//  TimeExtensions.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/26/24.
//

import Foundation

extension Time {
    var totalSeconds: Int {
        return hours * 3600 + minutes * 60 + seconds
    }
}
