//
//  PizzeriaViewController.swift
//  Pizzeria
//
//  Created by Sam Dindyal on 2018-08-01.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class PizzeriaViewController: UITableViewController {
    var pizzeria:Pizzeria!
    
    var numberFormatter:NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderCell
        let order = self.pizzeria.orders[indexPath.row]
        cell.orderNumberLabel.text = "Order \(indexPath.row + 1)"
        cell.orderDescriptionLabel.text = "\(order.pizzas.count) item\(order.pizzas.count == 1 ? "" : "s")"
        cell.orderCostLabel.text = "$\(numberFormatter.string(from: NSNumber(value: order.cost)) ?? "???")"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzeria.orders.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "addOrder":
            let orderViewController = segue.destination as! OrderViewController
            orderViewController.order = self.pizzeria.startOrder()
        case "showOrder":
            let orderViewController = segue.destination as! OrderViewController
            if let row = tableView.indexPathForSelectedRow?.row {
                let order = self.pizzeria.orders[row]
                orderViewController.order = order
            }
        default:
            preconditionFailure("Unrecognized segue identifier: \(segue.identifier!)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.pizzeria.orderInProgress != nil && self.pizzeria.orderInProgress.hasPizzas() {
            self.pizzeria.finishOrder()
        }
        
        tableView.reloadData()
    }
}
