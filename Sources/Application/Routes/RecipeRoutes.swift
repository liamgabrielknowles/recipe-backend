//
//  File.swift
//  
//
//  Created by Liam Knowles on 7/14/20.
//

import Kitura
import KituraContracts

func initializeRecipeRoutes(app: App) {
    app.router.get("/recipe", handler: app.handleGetRecipe)
}

extension App {

    func handleGetRecipe(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) {
        execute {
            do {
            response.send(try recipeDataStore.generateRecipe())
            }
            catch {
                response.send(status: .internalServerError)
            }
            next()
        }
    }
}
