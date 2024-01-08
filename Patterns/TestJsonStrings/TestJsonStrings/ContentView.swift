//
//  ContentView.swift
//  TestJsonStrings
//
//  Created by sreekanth reddy iragam on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct MyData: Codable {
    let name: String
    let age: Int
    let amount: Double
}
