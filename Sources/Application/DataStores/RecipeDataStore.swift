//
//  File.swift
//  
//
//  Created by Liam Knowles on 7/14/20.
//

import Foundation

enum RecipeDataStoreError: Error {
    case noIngredient
}

class RecipeDataStore: DataStore {
    var recipes: [Recipe] = [
    ]
    let ingredientDataStore: IngredientDataStore
    
    init(ingredientDataStore: IngredientDataStore) {
        self.ingredientDataStore = ingredientDataStore
    }
    
    func generateRecipe() throws -> Recipe {
        var ingredients = [Ingredient]()
        var numberOfIngredients = (1 ... 10).randomElement()!
        
        for _ in (0 ..< numberOfIngredients) {
            guard let ingredient = ingredientDataStore.ingredients.randomElement() else {
                throw RecipeDataStoreError.noIngredient
            }
            ingredients.append(ingredient)
        }
        
        let recipe = Recipe(name: "Liam's Recipe", steps: [], ingredients: ingredients)
        recipes.append(recipe)
        return recipe
    }
}
