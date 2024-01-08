//
//  ContentView.swift
//  SwiftUIContextMenu
//
//  Created by sreekanth reddy iragam on 12/19/21.
//

import SwiftUI

struct ContentView: View {
    @State var myColor: Color = .red
    var body: some View {
        VStack {
        Label("All Details", systemImage: "sun.min")
            .padding()
            Text("are present here")
                .padding()
        }.contextMenu {
            Button("select yellow") {
                myColor = .yellow
            }
            
            Button {
                myColor = .purple
            } label: {
                Label("select purple", systemImage: "heart.fill")
            }

            
            Button {
                myColor = .green
            } label: {
                HStack {
                    Text("select green")
                    Image(systemName: "flame.fill")
                }
            }

        }.background(myColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
