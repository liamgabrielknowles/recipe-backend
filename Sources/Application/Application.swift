import Foundation
import Kitura
import LoggerAPI
import Configuration
import CloudEnvironment
import KituraContracts
import Health

public let projectPath = ConfigurationManager.BasePath.project.path
public let health = Health()

public class App {
    let router = Router()
    let cloudEnv = CloudEnv()
    let recipeDataStore: RecipeDataStore
    let ingredientDataStore = IngredientDataStore()
    let workerQueue = DispatchQueue(label: "worker")

    public init() throws {
        // Configure logging
        initializeLogging()
        // Run the metrics initializer
        initializeMetrics(router: router)
        recipeDataStore = RecipeDataStore(ingredientDataStore: ingredientDataStore)
    }

    func postInit() throws {
        // Endpoints
        initializeHealthRoutes(app: self)
        initializeIngredientRoutes(app: self)
        initializeRecipeRoutes(app: self)
    }

    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: cloudEnv.port, with: router)
        Kitura.run()
    }

    func execute(_ block: () -> Void) {
        workerQueue.sync {
            block()
        }
    }
}
