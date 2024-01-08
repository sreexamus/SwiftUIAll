//
//  ContentView.swift
//  SwiftUIMaps
//
//  Created by sreekanth reddy iragam on 4/8/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var newYourRegion = MKCoordinateRegion(
         center: CLLocationCoordinate2D(latitude: 40.730610, longitude: -73.935242),
         span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
     )
     var body: some View {
         //Map(coordinateRegion: $newYourRegion)
         //    .ignoresSafeArea()
         Map(coordinateRegion: $newYourRegion, showsUserLocation: true, userTrackingMode: .constant(.follow))
             .ignoresSafeArea()
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
