//
//  ContentView.swift
//  SwiftUIToggle
//
//  Created by sreekanth reddy iragam on 12/19/21.
//

import SwiftUI

struct ContentView: View {
    @State var toggle: Bool = false
    var body: some View {
        VStack {
            HStack {
                Text("Use Toggle Button")
                    .padding()
                    .font(.title3)
                Text(toggle ? "Online" : "Offline")
                    .padding()
                    .font(.title3)
            }
            Toggle(isOn: $toggle) {
                Text("Remember Me")
            }.toggleStyle(SwitchToggleStyle(tint: .gray))
                .padding(.horizontal, 50)
            Spacer()
        }.padding(.horizontal, 10)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
