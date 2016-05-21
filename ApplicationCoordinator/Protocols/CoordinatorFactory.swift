//
//  CoordinatorFactory.swift
//  Services
//
//  Created by Andrey Panov on 21.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

class CoordinatorFactory {
    
    func createItemCoordinatorBox(navController navController: UINavigationController? = nil) ->
        (itemCoordinator: ItemCoordinator,
        router: Router) {
        let coordinator = ItemCoordinator(router: router(navController),
                                         factory: ItemControllersFactory(),
                              coordinatorFactory: CoordinatorFactory())
        return (coordinator, coordinator.router)
    }
    
    func createSettingsCoordinatorBox(navController navController: UINavigationController? = nil) ->
        (settingsCoordinator: SettingsCoordinator,
        router: Router) {
        let coordinator = SettingsCoordinator(router: router(navController),
                                             factory: SettingsControllersFactory())
        return (coordinator, coordinator.router)
    }
    
    func createItemCreationCoordinatorBox(navController navController: UINavigationController? = nil) ->
        (createCoordinator: ItemCreateCoordinator,
        router: Router) {
        
        let coordinator = ItemCreateCoordinator(router: router(navController),
                                               factory: ItemCreateControllersFactory())
        return (coordinator, coordinator.router)
    }
    
    func createAuthCoordinatorBox(navController navController: UINavigationController? = nil) ->
        (authCoordinator: AuthCoordinator,
        router: Router) {
        let coordinator = AuthCoordinator(router: router(navController),
                                         factory: AuthControllersFactory())
        return (coordinator, coordinator.router)
    }
    
    private func router(navController: UINavigationController?) -> Router {
        return RouterImp(rootController: navigationController(navController))
    }
 
    private func navigationController(navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        } else {
            return UINavigationController.controllerFromStoryboard(.Main)
        }
    }
}