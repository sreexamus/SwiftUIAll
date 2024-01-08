//
//  RestaurantsInfoViewModel.swift
//  SwiftUITaskExmaples
//
//  Created by sreekanth reddy iragam on 4/30/23.
//

import Foundation

class RestaurantsInfoViewModel: ObservableObject {
    @Published var restaurants: [Restaurants] = []
    
    func addRestaurants(_ restaurant: [Restaurants]) async {
        await MainActor.run(body: {
            restaurants.append(contentsOf: restaurant)
        })
        print("added all restaurants")
    }
    
    func addDataConcurrently() {
        print("initiate adding items")
        Task {
            await addRestaurants([Restaurants(name: "Kabab"),
                                  Restaurants(name: "Indian Biryani"),
                                  Restaurants(name: "Chinese"),
                                  Restaurants(name: "Pani Poori")])
           print("adding items completed")
        }
    }
}
