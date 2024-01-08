//
//  StateObjectView.swift
//  StateObjObservedObjDifference
//
//  Created by sreekanth reddy iragam on 4/30/23.
//

import SwiftUI

struct StateObjectView: View {
    @StateObject var viewModel = StateObjectViewModel()
    let newState = "Tamil"
    var body: some View {
        List {
            ForEach(viewModel.cities) { city in
                Text(city.name)
            }
        }.onAppear {
            viewModel.addCities([Cities(name: "Andhra"), Cities(name: "TG"), Cities(name: "Maha"), Cities(name: newState)])
        }
    }
}

struct StateObjectView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectView()
    }
}
