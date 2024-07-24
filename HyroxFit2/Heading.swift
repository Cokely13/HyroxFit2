//
//  Heading.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/24/24.
//

import SwiftUI

struct Heading: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .padding()
            .multilineTextAlignment(.center)
    }
}

struct Heading_Previews: PreviewProvider {
    static var previews: some View {
        Heading(text: "Trending Woofs")
    }
}

