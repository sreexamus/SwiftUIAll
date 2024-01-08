//
//  MovieMigrationPlan.swift
//  SwiftDataExamples
//
//  Created by sreekanth reddy iragam on 1/6/24.
//

import SwiftData

class MovieMigrationPlan: SchemaMigrationPlan {
    static var schemas: [VersionedSchema.Type] = [
        MoviesSchemaVersion1.self,
        MoviesSchemaVersion2.self,
        MoviesSchemaVersion3.self
    ]
    
    static var stages: [MigrationStage] = [migrateFromV1ToV2, migrateFromV2ToV3]
    
    static var migrateFromV1ToV2 = MigrationStage.lightweight(fromVersion: MoviesSchemaVersion1.self, toVersion: MoviesSchemaVersion2.self)
    static var migrateFromV2ToV3 = MigrationStage.lightweight(fromVersion: MoviesSchemaVersion2.self, toVersion: MoviesSchemaVersion3.self)
    
}
