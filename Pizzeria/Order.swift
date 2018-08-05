//
//  Order.swift
//  Pizzeria
//
//  Created by Sam Dindyal on 2018-08-02.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class Order {
    var pizzas:[Pizza] {
        didSet {
            self.cost = self.pizzas.reduce(0, {
                x, y in
                x + y.cost
            })
        }
    }
    
    var pizzaInProgress:Pizza!
    
    var cost:Float!
    init(pizzas:[Pizza] = []) {
        self.pizzas = pizzas
    }
    
    func addPizza(pizza: Pizza) {
        self.pizzas.append(pizza)
    }
    
    func startPizza(pizza: Pizza) -> Pizza {
        self.pizzaInProgress = Pizza()
        return self.pizzaInProgress
    }
    
    func finishOrder() {
        self.addPizza(pizza: self.pizzaInProgress)
        self.pizzaInProgress = nil
    }
    
    func cancelOrder() {
        self.pizzaInProgress = nil
    }
}
