//
//  ContentView.swift
//  SwiftUIPatterns
//
//  Created by sreekanth reddy iragam on 8/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            let crustPizza = MyPizza(pizza: BasePizza())
            Text("Pizza Price:-\(crustPizza.price)")
          
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
