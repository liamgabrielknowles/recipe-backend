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
}

extension App {

    func handleGetAll(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) {
        execute {
            response.send(ingredientDataStore.ingredients)
            next()
        }
    }
}
