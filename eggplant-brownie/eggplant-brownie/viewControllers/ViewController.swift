//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Pedro Paulo on 08/10/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,
UITableViewDelegate, AddAnItemDelegate{
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var HappinessField: UITextField?
    var delegate: AddAMealDelegate?
    var selected = Array<Item>()
    var items = [
        Item(name: "Muçarela", calorie: 150),
        Item(name: "Orégano", calorie: 5),
        Item(name: "Massa de Pizza", calorie: 550),
        Item(name: "Hamburguer", calorie: 300),
        Item(name: "Tomate", calorie: 20),
        Item(name: "Pão de Hamburguer", calorie: 250),
        Item(name: "Alface", calorie: 9)
    ]
    @IBOutlet var tableView: UITableView?
    
    func add(_ item: Item) {
        items.append(item)
        if let table = tableView {
        table.reloadData()
    }
}

override func viewDidLoad() {
    let newItemButton = UIBarButtonItem(title: "new item", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showNewItem))
    navigationItem.rightBarButtonItem = newItemButton
}

@objc func showNewItem(){
    let newItem = NewItemViewController(delegate: self)
    if let navigation = navigationController{
        navigation.pushViewController(newItem, animated: true)
    }
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath){
        if (cell.accessoryType == UITableViewCellAccessoryType.none){
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
            let item = items[indexPath.row]
            selected.append(item)
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.none
            let item = items [indexPath.row]
            if let position = selected.index(of: item){
                selected.remove(at: position)
            }
        }
    }
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    let item = items[row]
    let cell = UITableViewCell (style: UITableViewCellStyle.default, reuseIdentifier: nil)
    cell.textLabel!.text = item.name
    return cell
}

@IBAction func add(){
    
    if (nameField == nil || HappinessField == nil){
        return
    }
    
    let name: String = nameField!.text!
    if let happiness = Int(HappinessField!.text!){
        let meal = Meal(name: name, happiness: happiness, items: selected)
        //meal.items = selected
        
        print ("eaten \(meal.name) with happiness \(meal.happiness) with \(meal.items)")
        
        if (delegate == nil){
            return
        }
        
        delegate!.add(meal)
        
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
            
        }
    }
    
}

}

