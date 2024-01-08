//
//  DataModels.swift
//  SwiftUIPatterns
//
//  Created by sreekanth reddy iragam on 8/27/23.
//

/// using Decorator pattern applying dynamic behaviour to an object with out affecting the behaviour of other objects of same type
protocol Pizza {
    var name: String { get }
    var price: Int { get }
}


protocol CrustPizza  {
    var pizza: Pizza { get }
    var name: String { get }
    var price: Int { get }
}

extension CrustPizza {
    var name: String {
        pizza.name + "Crust"
    }
    var price: Int {
        pizza.price + 5
    }
}


struct MyPizza : CrustPizza {
    var pizza: Pizza

}

struct BasePizza: Pizza {
    var name = "Pizza"
    var price = 10
}


