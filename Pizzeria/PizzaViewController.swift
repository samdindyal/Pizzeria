//
//  PizzaViewController.swift
//  Pizzeria
//
//  Created by Sam Dindyal on 2018-08-05.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class PizzaViewController: UIViewController {
    var pizza:Pizza!
    var numberFormatter:NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    @IBOutlet var sizeSlider:UISlider!
    @IBOutlet var sizeLabel:UILabel!
    @IBOutlet var costLabel:UILabel!
    
    @IBAction func changePizzaSize(sender: UISlider) {
        self.pizza.size = Int(sender.value)
        sender.value = Float(self.pizza.size)
        sizeLabel.text = "\(self.pizza.size)\""
        costLabel.text = "$\(self.numberFormatter.string(from: NSNumber(value: self.pizza.cost!)) ?? "???")"
    }
}
