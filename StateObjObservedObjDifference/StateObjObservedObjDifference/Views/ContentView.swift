//
//  ContentView.swift
//  StateObjObservedObjDifference
//
//  Created by sreekanth reddy iragam on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var counter = 0
    var body: some View {
        VStack {

            Text("New Counter: \(counter)")
            Button {
                counter += 1
            } label: {
                Text("Hit To Change")
            }

           // ObservedObjectView()
            StateObjectView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
