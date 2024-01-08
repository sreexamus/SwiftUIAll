//
//  UpdateMovieView.swift
//  SwiftDataExamples
//
//  Created by sreekanth reddy iragam on 12/30/23.
//

import SwiftUI

struct UpdateMovieView: View {
    @Environment(\.dismiss) var dismissView
    var zones = ["Action", "Drama", "Romance", "Suspense"]
    var countries = ["US", "India", "Canada", "Mexico"]
    @Bindable var movie: Movie
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
            RatingView(rating: $movie.rating)
            HStack {
                Spacer()
                Button("Update Movie") {
                    dismissView()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    UpdateMovieView(movie: Movie())
}
