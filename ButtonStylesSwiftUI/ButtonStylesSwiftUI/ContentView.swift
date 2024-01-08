//
//  ContentView.swift
//  ButtonStylesSwiftUI
//
//  Created by sreekanth reddy iragam on 4/4/23.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    let scaleData: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .scaleEffect(configuration.isPressed ? scaleData : 1)
        .opacity(configuration.isPressed ? 0.9 : 1)
    }
}

extension View {
    func addMyButtonStyle(scaleData: CGFloat) -> some View {
        buttonStyle(MyButtonStyle(scaleData: scaleData))
    }
}

struct ContentView: View {
    var body: some View {
        Button {
            print("pressed")
        } label: {
            Text("First One")
                .bold()
                .frame(height: 50)
                .frame(width: 100)
                .foregroundColor(.red)
        }.buttonStyle(MyButtonStyle(scaleData: 0.7))
        
        Button {
            print("pressed")
        } label: {
            Text("Second One")
                .bold()
                .frame(height: 50)
                .frame(width: 100)
                .foregroundColor(.red)
        }.addMyButtonStyle(scaleData: 0.8)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
