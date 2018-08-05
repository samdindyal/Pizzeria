//
//  Pizza.swift
//  Pizzeria
//
//  Created by Sam Dindyal on 2018-08-02.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class Pizza {
    var size:Int {
        didSet {
            self.cost = (powf(Float(size), 2) * 0.05 * 0.75) + 1
        }
    }
    
    var cost:Float!
    
    init(size:Int = 6) {
        self.size = size
        self.cost = (powf(Float(size), 2) * 0.05 * 0.75) + 1
    }
}
