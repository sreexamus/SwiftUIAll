//
//  DateHolder.swift
//  CalendarSwiftUI
//
//  Created by sreekanth reddy iragam on 4/3/23.
//

import Foundation
import Combine

class DataHolder: ObservableObject {
    @Published var todayDate = Date()
}
