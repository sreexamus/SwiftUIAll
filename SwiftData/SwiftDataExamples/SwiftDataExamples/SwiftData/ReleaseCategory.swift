//
//  ReleaseCategory.swift
//  SwiftDataExamples
//
//  Created by sreekanth reddy iragam on 1/1/24.
//

import SwiftData

typealias ReleaseCategory = MoviesSchemaVersion3.ReleaseCategory

enum ReleaseTypes: String, CaseIterable {
    case amazonPrime = "Amazon Prime"
    case netflix = "Netflix"
    case hulu = "Hulu"
    case disney = "Disney"
    case aha = "Aha"
}
