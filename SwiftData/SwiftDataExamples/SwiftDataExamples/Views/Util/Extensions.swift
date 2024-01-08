//
//  Extensions.swift
//  SwiftDataExamples
//
//  Created by sreekanth reddy iragam on 1/6/24.
//

import SwiftUI

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
