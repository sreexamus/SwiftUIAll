//
//  QuickActionSettings.swift
//  SUIQuickActions
//
//  Created by sreekanth reddy iragam on 11/29/21.
//

import Foundation

class QuickActionSettings: ObservableObject {
    enum QuickAction: Hashable {
           case home
           case details(name: String)
       }
       
       @Published var quickAction: QuickAction? = nil
}
