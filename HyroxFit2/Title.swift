//
//  Title.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/24/24.
//

import SwiftUI
import Foundation

struct Title: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.secondary)
            .padding()
            .multilineTextAlignment(.center)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(text: "Woofs & friends")
    }
}

