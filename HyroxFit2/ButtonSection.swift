//
//  Button.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/24/24.
//

import SwiftUI

struct ButtonSection: View {
    var body: some View {
        Button(action: {
            print("Get Started tapped!")
        }) {
            Text("Get Started")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
        }
        .padding([.leading, .trailing], 20)
    }
}

#Preview {
    ButtonSection()
}
