//
//  ContentView.swift
//  SwiftUICombine
//
//  Created by sreekanth reddy iragam on 12/2/21.
//

import SwiftUI
import Combine

struct NewContentView: View {
    @StateObject var vm: NewViewModel = NewViewModel()
    var body: some View {
        NavigationView {
            VStack {
            Text("Hello, world!")
                NavigationLink("new screen", destination: SecondView(vm: vm))
            }
        }
    }
}

struct SecondView: View {
    @ObservedObject var vm: NewViewModel
    init(vm: NewViewModel) {
        self.vm = vm
    }
    var body: some View {
 
        VStack {
            Text("SecondView!")
                .padding()
                .background(Color.gray)
            Button("HitCall with subscriber(AnyCancellable) cancelled") {
                vm.callNetwork()
                vm.subscriber?.cancel()
            }.padding()
            
            Button("HitCall with subscriber(AnyCancellable)") {
                vm.callNetwork()
            }
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewContentView()
    }
}
