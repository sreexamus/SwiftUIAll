//
//  MoviesSchemaVersion2.swift
//  SwiftDataExamples
//
//  Created by sreekanth reddy iragam on 1/6/24.
//

import Foundation
import SwiftData

enum MoviesSchemaVersion2: VersionedSchema {
    static var models: [any PersistentModel.Type] = [Movie.self, ReleaseCategory.self]
    
    static var versionIdentifier: Schema.Version = .init(1, 0, 1)

}

extension MoviesSchemaVersion2 {
    @Model
    class Movie {
        @Attribute(.unique)
        var title: String
        var zoner: String
        var isFavourite: Bool
        var country: String
        var budget: String?
        var rating: Int
        var timeCreated: Date
        @Relationship(deleteRule: .nullify, inverse: \ReleaseCategory.movies)
        var release: ReleaseCategory?
        
        init(title: String = "",
             zoner: String = "Drama",
             isFavourite: Bool = false,
             rating: Int = 1,
             country: String = "US",
             budget: String = "0") {
            self.title = title
            self.zoner = zoner
            self.isFavourite = isFavourite
            self.rating = rating
            self.country = country
            self.budget = budget
            timeCreated = Date()
        }
    }
    
    @Model
    class ReleaseCategory {
        @Attribute(.unique)
        var release: String
        var movies: [Movie]
        init(release: String = ReleaseTypes.amazonPrime.rawValue, movies: [Movie] = []) {
            self.release = release
            self.movies = movies
        }
    }
}

