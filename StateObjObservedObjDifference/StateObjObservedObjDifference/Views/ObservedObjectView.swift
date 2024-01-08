//
//  ObservedObjectView.swift
//  StateObjObservedObjDifference
//
//  Created by sreekanth reddy iragam on 4/30/23.
//

import SwiftUI

struct ObservedObjectView: View {
    @ObservedObject var viewModel = ObservedObjectViewModel()
    let newState = "Srilanka"
    var body: some View {
        List {
            ForEach(viewModel.countries) { city in
                Text(city.name)
            }
        }.onAppear {
            viewModel.addCities([Country(name: "USA"), Country(name: "India"), Country(name: "Australia"), Country(name: newState)])
        }
    }
}

struct ObservedObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectView()
    }
}
