//
//  ContentView.swift
//  NavigationInSwiftUI
//
//  Created by sreekanth reddy iragam on 4/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Nw Screen",
                           destination: Text("sc1dsfdfd"))
//        Spacer()
//        NavigationLink(destination: Text("sdssd")) {
//            Text("^^^^")
//        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
