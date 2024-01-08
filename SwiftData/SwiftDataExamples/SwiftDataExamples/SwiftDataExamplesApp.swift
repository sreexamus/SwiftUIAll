//
//  SwiftDataExamplesApp.swift
//  SwiftDataExamples
//
//  Created by sreekanth reddy iragam on 12/28/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExamplesApp: App {
    var sharedModelContainer: ModelContainer = {
        // as Movie has Release Category it need not be specified in the schema
        let schema = Schema([
            Movie.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        let container: ModelContainer
        do {
            container = try ModelContainer(for: schema,
                                      migrationPlan: MovieMigrationPlan.self,
                                      configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
        return container
    }()

    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(sharedModelContainer)
        }
    }
}
