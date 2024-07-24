//
//  ContentView.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/2/24.
//



import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            ImageSection()
            TextSection()
            ButtonSection()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
