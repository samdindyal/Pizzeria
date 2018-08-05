//
//  Pizzeria.swift
//  Pizzeria
//
//  Created by Sam Dindyal on 2018-08-01.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class Pizzeria {
    var orders:[Order]
    var orderInProgress:Order!
    
    init(orders:[Order] = []) {
        self.orders = orders
    }
    
    func addOrder(order: Order) {
        self.orders.append(order)
    }
    
    func startOrder() -> Order {
        self.orderInProgress = Order()
        return self.orderInProgress
    }
    
    func finishOrder() {
        self.addOrder(order: self.orderInProgress)
        self.orderInProgress = nil
    }
    
    func cancelOrder() {
        self.orderInProgress = nil
    }
    
    func hasOrders() -> Bool {
        return !self.orders.isEmpty
    }
}
