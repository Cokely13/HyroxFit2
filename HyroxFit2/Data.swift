//
//  Data.swift
//  HyroxFit2
//
//  Created by Ryan Cokely on 7/24/24.
//

import Foundation

struct Woof: Identifiable {
    let id: String
    let name: String
    let avatar: String
}

struct Post: Identifiable {
    let id: String
    let image: String
    let title: String
    let description: String
}

let data = (
    woofs: [
        Woof(id: "woof-1", name: "Rex", avatar: "https://images.unsplash.com/photo-1558788353-f76d92427f16?auto=format&fit=crop&w=648&q=80"),
        Woof(id: "woof-2", name: "Ball", avatar: "https://images.unsplash.com/photo-1585584114963-503344a119b0?auto=format&fit=crop&h=64&q=80"),
        // Add other woofs here
    ],
    posts: [
        Post(id: "post-1", image: "https://images.unsplash.com/photo-1544568100-847a948585b9?auto=format&fit=crop&w=967&q=80", title: "Happy Woofs", description: "How to keep your woof healthy and happy."),
        Post(id: "post-2", image: "https://images.unsplash.com/photo-1450778869180-41d0601e046e?auto=format&fit=crop&w=850&q=80", title: "Woofs & friends", description: "Best friends are important for humans, but also for dogs."),
        // Add other posts here
    ]
)
