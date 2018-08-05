//
//  OrderViewController.swift
//  Pizzeria
//
//  Created by Sam Dindyal on 2018-08-01.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//
import UIKit

class OrderViewController: UITableViewController {
    var order:Order!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.pizzas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
//        cell.textLabel?.text = "\(self.order.pizzas[indexPath.row].size)\" Pizza"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "addPizza":
            let pizzaViewController = segue.destination as! PizzaViewController
            pizzaViewController.pizza = Pizza()
        default:
            preconditionFailure("Unrecognized segue identifier: \(segue.identifier!)")
        }
    }
    
}
