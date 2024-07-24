//
//  WoofCard.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/24/24.
//

import SwiftUI

struct WoofCard: View {
    let name: String
    let avatar: String
    
    var body: some View {
        VStack {
            Avatar(url: avatar)
            Title(text: name)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct WoofCard_Previews: PreviewProvider {
    static var previews: some View {
        WoofCard(name: "Rex", avatar: "https://images.unsplash.com/photo-1558788353-f76d92427f16?auto=format&fit=crop&w=648&q=80")
    }
}

