//
//  ContentView.swift
//  ProductListApp
//
//  Created by sreekanth reddy iragam on 4/5/23.
//

import SwiftUI

struct ContentView: View {
    let allItems = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationStack {
            List {
                ForEach(allItems) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            // first approach in efficient
//                            NavigationLink {
//                                ProductDetailsView(imageDetails: item.mainImage,
//                                                   name: item.name,
//                                                   photoCredit: item.photoCredit,
//                                                   desc: item.description)
//                            } label: {
//                                ProductView(name: item.name, image:
//                                                item.mainImage,
//                                            photoCredit: item.photoCredit,
//                                            price: item.price,
//                                            restrictions: item.restrictions)
//                            }
                            
                            // second approach
                            
                            NavigationLink(value: item) {
                                ProductView(item: item)
                            }
                            
                        }
                    }
                }
            }
            .navigationDestination(for: MenuItem.self, destination: { item in
                ProductDetailsView(item: item)
            })
            .navigationTitle("All Items")
            .listStyle(.grouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
