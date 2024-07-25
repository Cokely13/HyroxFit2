import SwiftUI
import Foundation

struct Avatar: View {
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            } else if phase.error != nil {
                Color.red // Indicates an error
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            } else {
                Color.gray // Placeholder while loading
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
        }
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(url: "https://images.unsplash.com/photo-1558788353-f76d92427f16?auto=format&fit=crop&w=648&q=80")
    }
}

