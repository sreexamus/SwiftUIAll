//
//  ViewModel.swift
//  SwiftUIPicker
//
//  Created by sreekanth reddy iragam on 12/19/21.
//

import Combine
import Foundation

class ViewModel: ObservableObject {
    @Published var selectedCity = "select city"
    @Published var mode: String = "Village"
 
    
    func getAllCities() -> [String] {
        return [ "select city","sfo", "dallas", "austin", "denver", "atlanta", "newjersey"]
    }
    
    func getModes() -> [String] {
        return [ "Village","Mandal", "Town", "City"]
    }
}
