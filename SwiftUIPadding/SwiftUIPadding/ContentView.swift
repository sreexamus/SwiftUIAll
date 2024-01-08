//
//  ContentView.swift
//  SwiftUIPadding
//
//  Created by sreekanth reddy iragam on 12/5/21.
//

import SwiftUI


/// .padding()  api adds 10 pixes by default on all sides.
struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading,
                   spacing: 20) {
                Text("Hi Madam")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("I will be late to the office as i have Dr appoinment today. will try to be available on phone and email. please allow me to take a leave")
                    .font(.headline)
                
            }
                   .padding()
                   .padding(.vertical, 20)
                   .background {
                       Color.white
                           .cornerRadius(10)
                           .shadow(color: Color.black.opacity(0.2),
                                   radius: 10,
                                   x: 2,
                                   y: 10)
                   }
            
            
            VStack {
                Text("Hello, world! This is new developer")
                    .background(Color.gray)
                    .padding()
                    .background(Color.green)
                    .padding(.top, 20)
                    .background(Color.red)
                
                Text("Welcome! This is new developer")
                    .background(Color.gray)
                    .padding(.leading, 40)
                    .background(Color.red)
                
                Text("Welcome! This is new developer from USA and living in this beautiful community of NewJersy!")
                    .background(Color.gray)
                    .multilineTextAlignment(.center)
                
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
