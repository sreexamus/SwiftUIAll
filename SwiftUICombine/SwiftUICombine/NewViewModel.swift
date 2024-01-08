//
//  NewViewModel.swift
//  SwiftUICombine
//
//  Created by sreekanth reddy iragam on 12/2/21.
//

import Combine
import Foundation

class NewViewModel: ObservableObject {
    var subscriber: AnyCancellable?
    
    deinit {
        print("deinit")
    }
    func callNetwork() {
        let publisher = URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.google.com")!)
        subscriber = publisher.sink { _ in
            
        } receiveValue: { data, response in
            print(response, self)
        }
    }
}
