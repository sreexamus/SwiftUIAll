//
//  ProductDetailsView.swift
//  ProductListApp
//
//  Created by sreekanth reddy iragam on 4/6/23.
//

import SwiftUI

struct ProductDetailsView: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("photo credit: \(item.photoCredit)")
                    .padding(3)
                    .foregroundColor(.white)
                    .background(.black)
                    .offset(x: -10, y: -10)
            }
            
            Text(item.name).font(.title)
            Text(item.description).font(.caption2)
            
            Button("Add to Order") {
                order.add(item: item)
            }.font(.title)
                .padding(25)
                .buttonStyle(.borderedProminent)
            Spacer()
            
        }.navigationTitle(item.name)
            .navigationBarTitleDisplayMode(.large)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductDetailsView(item: MenuItem(id: UUID(), name: "Stack-o-Pancakes", photoCredit: "NN", price: 1, restrictions: ["V"], description: "jdsfjdj"))
                .environmentObject(Order())
        }
    }
}
