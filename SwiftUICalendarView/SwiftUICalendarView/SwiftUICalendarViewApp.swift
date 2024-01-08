//
//  SwiftUICalendarViewApp.swift
//  SwiftUICalendarView
//
//  Created by sreekanth reddy iragam on 12/5/21.
//

import SwiftUI

@main
struct SwiftUICalendarViewApp: App {
    var body: some Scene {
        WindowGroup {
            VeticalCalendarView().padding(.horizontal, 3)
        }
    }
}
