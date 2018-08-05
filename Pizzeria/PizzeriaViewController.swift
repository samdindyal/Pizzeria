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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath)
        cell.textLabel?.text = "Order \(indexPath.row)"
        cell.detailTextLabel?.text = "\(pizzeria.orders.count) item\(pizzeria.orders.count == 1 ? "" : "s")"
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
        default:
            preconditionFailure("Unrecognized segue identifier: \(segue.identifier!)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.pizzeria.orderInProgress != nil && self.pizzeria.orderInProgress.hasPizzas() {
            self.pizzeria.finishOrder()
            tableView.reloadData()
        }
    }
}
