//
//  File.swift
//  
//
//  Created by Liam Knowles on 7/14/20.
//

import Foundation

class Recipe: Codable {
    let name: String
    let id: String
    let steps: [Step]
    let ingredients: [Ingredient]
    
    init(name: String, id: String = UUID().uuidString, steps: [Step], ingredients: [Ingredient]) {
        self.name = name
        self.id = id
        self.steps = steps
        self.ingredients = ingredients 
    }
    
    
}
