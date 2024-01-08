//
//  NewRestaurantsInfoViewModel.swift
//  SwiftUITaskExmaples
//
//  Created by sreekanth reddy iragam on 4/30/23.
//

import Foundation

class NewRestaurantsInfoViewModel: ObservableObject {
    private(set) var restaurants: [Restaurants] = []
    
    func addRestaurants(_ restaurant: [Restaurants]) async {
        await MainActor.run(body: {
            restaurants.append(contentsOf: restaurant)
            objectWillChange.send()
        })
        print("added all restaurants")
    }
    
    func addDataConcurrently() {
        print("initiate adding items")
        Task {
            await addRestaurants([Restaurants(name: "Chilli Chicken"),
                                  Restaurants(name: "Tandoor Biryani"),
                                  Restaurants(name: "Mayuri"),
                                  Restaurants(name: "Peacock")])
           print("adding items completed")
        }
    }
}
