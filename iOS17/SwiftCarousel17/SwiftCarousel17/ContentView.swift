//
//  ContentView.swift
//  SwiftCarousel17
//
//  Created by sreekanth reddy iragam on 8/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @ObservedObject var viewModel = CitiesViewModel()
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                HStack(spacing: 12) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.blue)
                    }
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                        TextField("Search", text: $searchText)
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(.ultraThinMaterial, in: .capsule)
                
                Text("Newyork Cities...").font(.largeTitle.bold())
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                // Caraousel
                GeometryReader(content: { geometry in
                    let size = geometry.size
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(viewModel.cities) { city in
                                GeometryReader(content: { geometry in
                                    let cardSize = geometry.size
                                    // parallax effect
                                    let minX = min((geometry.frame(in: .scrollView).minX - 30) * 1.4, geometry.size.width * 1.4)
                                    Image(city.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .scaleEffect(1.25)
                                        .offset(x: -minX)
                                        .frame(width: geometry.size.width * 2.5)
                                        .frame(width: cardSize.width, height: cardSize.height)
                                        .overlay(content: {
                                            ZStack(alignment: .leading) {
                                                Text("NYC").font(.subheadline)
                                                    .colorMultiply(.red)
                                            }
                                        })
                                        .clipShape(.rect(cornerRadius: 15))
                                        .shadow(color: .black.opacity(0.25), radius: 8, x: 5, y: 10)
                                })
                                .frame(width: size.width - 60, height: size.height - 50)
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view.scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                            }
                        }.padding(.horizontal, 30)
                         .scrollTargetLayout()
                         .frame(height: size.height, alignment: .top)
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                })
                .frame(height: 500)
                .padding(.horizontal, -15)
                .padding(.top, 10)
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
