//
//  IngredientDataStore.swift
//  
//
//  Created by Ryan LaSante on 7/14/20.
//

import Foundation

class IngredientDataStore: DataStore {
    var ingredients: [Ingredient] = [
        Ingredient(name: "Chicken", amount: 1),
        Ingredient(name: "Water", amount: 3)
    ]
    
}
