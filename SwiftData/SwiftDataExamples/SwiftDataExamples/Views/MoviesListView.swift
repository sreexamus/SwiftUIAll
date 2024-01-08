//
//  MoviesListView.swift
//  SwiftDataExamples
//
//  Created by sreekanth reddy iragam on 12/28/23.
//

import SwiftUI
import SwiftData

struct MoviesListView: View {
    @Query(filter: #Predicate<Movie> { $0.isFavourite == true },
           sort: \.timeCreated,
           order: .forward)
    var movies: [Movie]
    @State private var showAddMovie = false
    @State private var showAddRelease = false
    @Environment(\.modelContext) var context
    @State private var movieToBeUpdated: Movie?
    @Query var releases: [ReleaseCategory]
    
    var body: some View {
        NavigationStack {
            Button(action: {
                showAddMovie.toggle()
            }, label: {
                Text("Add Movies")
            })
            
            Button(action: {
                showAddRelease.toggle()
            }, label: {
                Text("Add Release Category")
            })
            List {
                ForEach(movies) { movie in
                    VStack {
                        HStack{Text("Title:")
                            Spacer()
                            Text(movie.title) }
                        HStack{Text("Favourite:")
                            Spacer()
                            Text(movie.isFavourite ? "yes" : "No") }
                        HStack{Text("Zoner:")
                            Spacer()
                            Text(movie.zoner) }
                        HStack{Text("Country:")
                            Spacer()
                            Text(movie.country) }
                    
                        HStack{Text("Release:")
                            Spacer()
                            if let release = movie.release?.release {
                                Text(release)
                            } else {
                                Text("None")
                            }
                        }
                        HStack{Text("Rating:")
                            Spacer()
                            RatingView(rating: .constant(movie.rating)) }
                        HStack{Text("Budget:")
                            Spacer()
                            Text(movie.budget ?? "0") }
                        HStack{Text("Production:")
                            Spacer()
                            Text(movie.production ?? "") }
                    }.swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                context.delete(movie)
                            }
                        } label: {
                           Label("Delete", systemImage: "trash")
                        }
                        Button {
                            movieToBeUpdated = movie
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }

                    }
                }
            } .onAppear(perform: {
                printMoviesOfRelease()
            })
            .sheet(isPresented: $showAddMovie, content: {
                NavigationStack {
                    CreateMovieView()
                }
            })
            .sheet(item: $movieToBeUpdated) {
                movieToBeUpdated = nil
            } content: { item in
                UpdateMovieView(movie: item)
            }
            .sheet(isPresented: $showAddRelease, content: {
                NavigationStack {
                    AddReleaseCategory()
                }
            })
        }
    }
    
    func printMoviesOfRelease() {
        movies.forEach { movie in
        print("movie..\(movie.title)")
        print("movie release..\(String(describing: movie.release?.release))")
        movie.release?.movies.forEach({ movie in
            print("movie release..\(movie.title)")
        })
        }
        
        releases.forEach { release in
            print("release name \(release.release)")
            release.movies.forEach { movie in
                print("release movie..\(movie.title)")
            }
            
        }
    }
}

#Preview {
    MoviesListView()
}
