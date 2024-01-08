//
//  EntryMainView.swift
//  ProductListApp
//
//  Created by sreekanth reddy iragam on 4/7/23.
//

import SwiftUI

struct EntryMainView: View {
    var body: some View {
        TabView {
            ContentView().tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            ProductOrderView().tabItem {
                Label("Orders", systemImage: "square.and.pencil")
            }
        }
    }
}

struct EntryMainView_Previews: PreviewProvider {
    static var previews: some View {
        EntryMainView().environmentObject(Order())
    }
}
