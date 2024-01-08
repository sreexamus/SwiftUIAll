//
//  ContentView.swift
//  SwiftUIPicker
//
//  Created by sreekanth reddy iragam on 12/19/21.
//

import SwiftUI

let cities = [ "select city","sfo", "dallas", "austin", "denver", "atlanta", "newjersey"]


struct ContentView: View {
    
    
    @State var vm = ViewModel()
    var body: some View {
        VStack {
        Text("Hello, world!")
            .padding()
            Picker("Selet City", selection: $vm.selectedCity) {
                ForEach(vm.getAllCities(), id: \.self) { city in
                    Text(city).tag(city)
                }
            }
            Button("print selected city") {
                print(vm.selectedCity)
                print(vm.mode)
            }
            
            Picker("Selet Mode", selection: $vm.mode) {
                ForEach(vm.getModes(), id: \.self) { mode in
                    Text(mode).tag(mode)
                }
            }.pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
