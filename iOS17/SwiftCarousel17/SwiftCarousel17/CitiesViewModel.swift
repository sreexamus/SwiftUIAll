//
//  CitiesViewModel.swift
//  SwiftCarousel17
//
//  Created by sreekanth reddy iragam on 8/15/23.
//

import Foundation

class CitiesViewModel: ObservableObject {
    var cities = [Cities(title: "Newyork1", subTitle: "nyc", image: "ny1"),
                  Cities(title: "Newyork2", subTitle: "nyc", image: "ny2"),
                  Cities(title: "Newyork3", subTitle: "nyc", image: "ny3")
    ]
}
