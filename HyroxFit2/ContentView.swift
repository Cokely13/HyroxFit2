import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        VStack {
            Heading(text: "Trending Woofs")
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(data.woofs, id: \.id) { woof in
                        WoofCard(name: woof.name, avatar: woof.avatar)
                    }
                }
            }
            
            Heading(text: "New Posts")
            
            ScrollView {
                VStack {
                    ForEach(data.posts, id: \.id) { post in
                        WoofPost(image: post.image, title: post.title, description: post.description)
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

