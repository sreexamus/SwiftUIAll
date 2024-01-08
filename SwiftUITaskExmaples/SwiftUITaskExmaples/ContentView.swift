//
//  ContentView.swift
//  SwiftUITaskExmaples
//
//  Created by sreekanth reddy iragam on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = RestaurantsInfoViewModel()
    @ObservedObject var viewModel1 = NewRestaurantsInfoViewModel()
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.restaurants) { restaurant in
                    Text(restaurant.name)
                }
                ForEach(viewModel1.restaurants) { restaurant in
                    Text(restaurant.name)
                }
            }
           
        }
        .padding()
        .onAppear {
            viewModel.addDataConcurrently()
            viewModel1.addDataConcurrently()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
