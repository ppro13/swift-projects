//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Pedro Paulo on 10/10/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {
    
    var meals = [
        Meal(name: "Pizza", happiness: 5),
        Meal(name: "Hamburguer", happiness: 5),
        Meal (name: "qulaquer coisa", happiness: 4)
    ]
    
    func add(_ meal: Meal){
        meals.append(meal)
        tableView.reloadData()        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal"){
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        cell.textLabel!.text = meal.name
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector (showDetails))
        
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell
    }
    
    @objc func showDetails(recognizer: UILongPressGestureRecognizer){
        if (recognizer.state == UIGestureRecognizerState.began){
            let cell = recognizer.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell){
                let row = indexPath.row
                let meal = meals[row]
                
                let details = UIAlertController(title: meal.name, message: "Happiness\(meal.happiness)", preferredStyle: UIAlertControllerStyle.alert)
                
                let ok =  UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                details.addAction(ok)
                
                present(details, animated: true, completion: nil)
            }
        }
    }
}

/*test range Swift 4
let number = 1
let number2 = 5
let underFive = number..<number2
print(underFive.contains(7))
 */
