//
//  QuickActionModel.swift
//  SUIQuickActions
//
//  Created by sreekanth reddy iragam on 11/29/21.
//

import Foundation

struct QuickActionModel : Identifiable {
    let id = UUID()
    let name: String
    let tag: QuickActionSettings.QuickAction
}

let allQuickActions = [
    QuickActionModel(name: "Contacts", tag: .details(name: "Contact")),
    QuickActionModel(name: "Chats",tag: .details(name: "Chat")),
    QuickActionModel(name: "Calls", tag: .details(name: "Call")),
    QuickActionModel(name: "Status", tag: .details(name: "Status")),
]
