//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Pedro Paulo on 10/10/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import Foundation

class Meal {
    
    let name: String
    let happiness: Int
    let items: Array<Item>
    
    init (name: String, happiness: Int, items: Array<Item> = []){
        self.name = name
        self.happiness = happiness
        self.items = items
        
    }
    
    func allCalorie() -> Double{
        var total = 0.0
        for item in items {
            total += item.calories
        }
        return total
    }
}
