//
//  IngredientRoutes.swift
//  
//
//  Created by Ryan LaSante on 7/13/20.
//
import Kitura
import KituraContracts

func initializeIngredientRoutes(app: App) {
    app.router.get("/ingredients/all", handler: app.handleGetAll)
    app.router.get("/ingredients", handler: app.handleGetOne)
}

extension App {

    func handleGetAll(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) {
        execute {
            response.send(ingredientDataStore.ingredients)
            next()
        }
    }

    func handleGetOne(id: Int, completion: @escaping (Ingredient?, RequestError?) -> Void) {
        execute {
            let ingredients = ingredientDataStore.ingredients
            guard id >= 0, id < ingredients.count else {
                completion(nil, .notFound)
                return
            }
            completion(ingredients[id], nil)
        }
    }
}
