//
//  ResultConfirmationView.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/26/24.
//

import Foundation
import SwiftUI

struct ResultConfirmationView: View {
    var body: some View {
        VStack {
            Text("You've Entered a Result!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)
                .padding(.bottom, 20)

            NavigationLink(destination: ContentView()) {
                Text("Home")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Result Entered", displayMode: .inline)
    }
}

struct ResultConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ResultConfirmationView()
    }
}
