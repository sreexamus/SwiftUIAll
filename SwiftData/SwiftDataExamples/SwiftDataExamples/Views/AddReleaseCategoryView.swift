//
//  AddReleaseCategory.swift
//  SwiftDataExamples
//
//  Created by sreekanth reddy iragam on 1/1/24.
//

import SwiftUI
import SwiftData

struct AddReleaseCategory: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismissView
    var releasesTypes = ReleaseTypes.allCases
    @State var selectedReleases = ReleaseTypes.hulu.rawValue
    @Query var releases: [ReleaseCategory]
    var body: some View {
        List {
            Section("Add Release") {
                Picker("Select Release", selection: $selectedReleases) {
                    ForEach(releasesTypes, id: \.self) {
                        Text($0.rawValue).tag($0.rawValue as String)
                    }
                }
                HStack {
                    Spacer()
                    Button("Add Release") {
                        print("selectedReleases.. \(selectedReleases)")
                        let release = ReleaseCategory(release: selectedReleases, movies: [])
                        print("selectedRelease movies.. \(release.movies)")
                        addReleaseCategory(release)
                        
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button("Done") {
                        dismissView()
                    }
                    Spacer()
                }
            }
            
            Section("Release List") {
                ForEach(releases) {
                    Text($0.release)
                }
            }
        }
    }
    
    func addReleaseCategory(_ release: ReleaseCategory) {
        context.insert(release)
    }
}

#Preview {
    AddReleaseCategory().modelContainer(for: Movie.self)
}

