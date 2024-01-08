//
//  ObservedObjectViewModel.swift
//  StateObjObservedObjDifference
//
//  Created by sreekanth reddy iragam on 4/30/23.
//

import Foundation

class ObservedObjectViewModel: ObservableObject {
    @Published var countries: [Country] = []
    
    func addCities(_ country: [Country]) {
        countries.append(contentsOf: country)
    }
}
