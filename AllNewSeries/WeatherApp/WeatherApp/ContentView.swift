//
//  ContentView.swift
//  WeatherApp
//
//  Created by sreekanth reddy iragam on 3/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue,.white, .green]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack(spacing: 10) {
                Text("New Delhi").bold()
                Image(systemName: "cloud.sun.fill")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                Text("76 Degrees")
                    .bold()
                    .font(.system(size: 40, weight: .medium))
                
                HStack(spacing: 10) {
                    VStack(spacing: 10) {
                        Image(systemName: "cloud.sun.fill")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Text("76 Degrees")
                            .bold()
                            .font(.system(size: 15, weight: .medium))
                    }
                    VStack(spacing: 10) {
                        Image(systemName: "cloud.sun.fill")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Text("76 Degrees")
                            .bold()
                            .font(.system(size: 15, weight: .medium))
                    }
                    VStack(spacing: 10) {
                        Image(systemName: "cloud.sun.fill")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Text("76 Degrees")
                            .bold()
                            .font(.system(size: 15, weight: .medium))
                    }
                }
                Spacer()
            }
            
      
         
            
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
