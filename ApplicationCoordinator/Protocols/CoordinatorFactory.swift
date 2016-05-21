//
//  CoordinatorFactory.swift
//  Services
//
//  Created by Andrey Panov on 21.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

class CoordinatorFactory {
    
    func createItemCoordinatorBox(navController navController: UINavigationController?) ->
        (itemCoordinator: ItemCoordinator,
        router: Router) {
        let coordinator = ItemCoordinator(router: router(navController),
                                          factory: ItemControllersFactory(),
                                          coordinatorFactory: CoordinatorFactory())
        return (coordinator, coordinator.router)
    }
    
    func createSettingsCoordinatorBox(navController navController: UINavigationController?) ->
        (settingsCoordinator: SettingsCoordinator,
        router: Router) {
        let coordinator = SettingsCoordinator(router: router(navController),
                                          factory: SettingsControllersFactory())
        return (coordinator, coordinator.router)
    }
    /*
    func createItemCreationCoordinatorBox() -> (createCoordinator: ItemCreateCoordinator, presenter: NavigationPresenter) {
        
        let presenter = NavigationPresenter(rootController: createNavigationController())
        return (ItemCreateCoordinator(presenter: presenter), presenter)
    }
    */
    func createAuthCoordinatorBox(navController navController: UINavigationController? = nil) ->
        (authCoordinator: AuthCoordinator,
        router: Router) {
        let coordinator = AuthCoordinator(router: router(navController),
                                          factory: AuthControllersFactory())
        return (coordinator, coordinator.router)
    }
 
    private func navigationController(navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        } else {
            return UINavigationController.controllerFromStoryboard(.Main)
        }
    }
    
    private func router(navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
}