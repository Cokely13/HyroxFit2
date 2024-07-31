//
//  UsersView.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/31/24.
//

import SwiftUI

struct UsersView: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        VStack {
            Text("Users")
                .font(.largeTitle)
                .padding(.bottom, 20)

            List(userData.users) { user in
                Text(user.username)
            }
        }
        .padding()
        .navigationTitle("View Users")
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
            .environmentObject(UserData())
    }
}
