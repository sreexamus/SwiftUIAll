//
//  ProductView.swift
//  ProductListApp
//
//  Created by sreekanth reddy iragam on 4/5/23.
//

import SwiftUI

struct ProductView: View {
    let item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .blue, "N": .red, "S": .gray, "V": .green]
    var body: some View {
        HStack {
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
                .frame(height: 50)
            VStack(alignment:.leading) {
                Text(item.name).font(.headline)
                Text("$ \(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { res in
                Text(res)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[res, default: .black])
                    .clipShape(Circle())
            }
        }
    }
}


struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(item: MenuItem(id: UUID(), name: "AA", photoCredit: "DDD", price: 2, restrictions: ["V"], description: "Nice"))
    }
}
