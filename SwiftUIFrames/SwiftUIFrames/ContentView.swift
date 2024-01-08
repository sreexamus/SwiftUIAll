//
//  ContentView.swift
//  SwiftUIFrames
//
//  Created by sreekanth reddy iragam on 12/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .background(Color.red)
            .frame(width: 200, height: 100, alignment: .top)
            .background(Color.yellow)
            .frame(width: 300, height: 300, alignment: .center)
            .background(Color.gray)
            .frame(minWidth: 10, idealWidth: 100, maxWidth: .infinity, minHeight: 10, idealHeight: 100, maxHeight: .infinity, alignment: .center)
            .background(Color.brown)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
