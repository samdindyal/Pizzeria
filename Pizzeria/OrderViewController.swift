//
//  OrderViewController.swift
//  Pizzeria
//
//  Created by Sam Dindyal on 2018-08-01.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//
import UIKit

class OrderViewController: UITableViewController {
    
    @IBAction func rewindToOrder(segue: UIStoryboardSegue) {
        self.order.cancelOrder()
    }
    
    var order:Order!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.pizzas.count
    }
    
    var numberFormatter:NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PizzaCell", for: indexPath)
        let pizza = self.order.pizzas[indexPath.row]
        cell.textLabel?.text = "\(pizza.size)\" Pizza"
        cell.detailTextLabel?.text = "$\(numberFormatter.string(from: NSNumber(value: pizza.cost)) ?? "???")"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "addPizza":
            let pizzaViewController = segue.destination as! PizzaViewController
            pizzaViewController.pizza = self.order.startPizza()
        default:
            preconditionFailure("Unrecognized segue identifier: \(segue.identifier!)")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.order.pizzaInProgress != nil {
         self.order.finishOrder()
         tableView.reloadData()
        }
        
    }
    
}
