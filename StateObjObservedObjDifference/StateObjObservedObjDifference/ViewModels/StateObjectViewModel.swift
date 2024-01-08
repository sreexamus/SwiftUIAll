//
//  StateObjectViewModel.swift
//  StateObjObservedObjDifference
//
//  Created by sreekanth reddy iragam on 4/30/23.
//

import Foundation

class StateObjectViewModel: ObservableObject {
    @Published var cities: [Cities] = []
    
    func addCities(_ city: [Cities]) {
        cities.append(contentsOf: city)
    }
}
