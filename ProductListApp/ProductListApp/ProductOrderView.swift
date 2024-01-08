//
//  ProductOrderView.swift
//  ProductListApp
//
//  Created by sreekanth reddy iragam on 4/7/23.
//

import SwiftUI

struct ProductOrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$ \(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink("Place Order") {
                        Text("Checkout")
                    }
                }
            }
        }
    }
}

struct ProductOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ProductOrderView()
            .environmentObject(Order())
    }
}
