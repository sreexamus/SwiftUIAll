//
//  ContentView.swift
//  AppCertTransparency
//
//  Created by sreekanth reddy iragam on 11/30/21.
//

import SwiftUI
import SafariServices

struct ContentView: View {
    @State var showSafari = false
    var body: some View {
        Text("Hello, world!")
            .padding()
        Button("Make Cert Trans Calls") {
            showSafari = true
            makeCalls()
        }.sheet(isPresented: $showSafari) {
            SafariView(url: URL(string: "https://www.google.com")!)
        }
    }
    
    
    
    func makeCalls() {
        URLSession.shared.dataTask(with: URL(string: "https://www.google.com")!) { data, res, error in
            if let res = res {
                print(res)
            }
        }.resume()
    }
}

struct SafariView: UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
