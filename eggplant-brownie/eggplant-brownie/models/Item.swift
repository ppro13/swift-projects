//
//  Item.swift
//  eggplant-brownie
//
//  Created by Pedro Paulo on 10/10/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import Foundation

class Item: Equatable {
    
    let name: String
    let calories: Double
    
    init (name: String, calorie: Double){
        
        self.name = name
        self.calories = calorie
    }
}

func == (first: Item, second: Item) -> Bool{
    return first.name == second.name && first.calories == second.calories
    
}
