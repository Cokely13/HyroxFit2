//
//  TextSection.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/24/24.
//

import SwiftUI

struct TextSection: View {
    var body: some View {
        VStack {
            Text("Welcome to HyroxFit2!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding([.leading, .trailing], 20)

            Text("Your fitness journey starts here.")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    TextSection()
}
