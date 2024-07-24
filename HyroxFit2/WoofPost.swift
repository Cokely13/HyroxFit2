import SwiftUI

struct WoofPost: View {
    let image: String
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: image)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else if phase.error != nil {
                    Color.red // Indicates an error
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Color.gray // Placeholder while loading
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct WoofPost_Previews: PreviewProvider {
    static var previews: some View {
        WoofPost(image: "https://images.unsplash.com/photo-1544568100-847a948585b9?auto=format&fit=crop&w=967&q=80", title: "Happy Woofs", description: "How to keep your woof healthy and happy.")
    }
}

