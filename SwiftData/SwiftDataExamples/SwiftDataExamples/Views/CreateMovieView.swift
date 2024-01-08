//
//  CreateMovieView.swift
//  SwiftDataExamples
//
//  Created by sreekanth reddy iragam on 12/28/23.
//

import SwiftUI
import SwiftData

struct CreateMovieView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismissView
    var zones = ["Action", "Drama", "Romance", "Suspense"]
    var countries = ["US", "India", "Canada", "Mexico"]
    @Query var releases: [ReleaseCategory]
    @State var selectedReleases: ReleaseCategory?
    @State var movie: Movie = Movie()
    var body: some View {
        List {
            TextField("MovieName", text: $movie.title)
            Toggle(isOn: $movie.isFavourite, label: {
                Text("is Favourite")
            })
            Picker("Select Zoner", selection: $movie.zoner) {
                ForEach(zones, id: \.self) {
                    Text($0)
                }
            }
                Picker("Select Country", selection: $movie.country) {
                    ForEach(countries, id: \.self) {
                        Text($0)
                    }
                }
                Picker("Select Release", selection: $selectedReleases) {
                    ForEach(releases) { release in
                        Text(release.release).tag(release as ReleaseCategory?)
                    }
                     Text("None").tag(nil as ReleaseCategory?)
                }
                RatingView(rating: $movie.rating)
            HStack {
                Text("Movie Budget")
                Spacer()
                TextField("Movie Budget", text: $movie.budget.toUnwrapped(defaultValue: "0"))
            }
            
            HStack {
                Text("Production")
                Spacer()
                TextField("Production", text: $movie.production.toUnwrapped(defaultValue: ""))
            }
           
                HStack {
                    Spacer()
                    Button("Add Movie") {
                        movie.release = selectedReleases
                        // movie.release?.movies.append(movie)
                        selectedReleases?.movies.append(movie)
                        addMovie()
                        dismissView()
                    }
                    Spacer()
                }
            }
        }
        
        func addMovie() {
            context.insert(movie)
            movie.release?.movies.append(movie)
        }
}

#Preview {
    CreateMovieView()
}
