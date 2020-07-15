//
//  Ingredient.swift
//  
//
//  Created by Ryan LaSante on 7/13/20.
//

import Foundation

class Ingredient: Codable {
    let name: String
    var amount: Int

    init(name: String, amount: Int) {
        self.name = name
        self.amount = amount
    }

    func add(newAmount: Int) -> Int {
        amount += newAmount
        return amount
    }
}
