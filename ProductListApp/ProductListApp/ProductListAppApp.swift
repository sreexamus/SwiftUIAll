//
//  ProductListAppApp.swift
//  ProductListApp
//
//  Created by sreekanth reddy iragam on 4/5/23.
//

import SwiftUI

@main
struct ProductListAppApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            EntryMainView().environmentObject(order)
        }
    }
}
