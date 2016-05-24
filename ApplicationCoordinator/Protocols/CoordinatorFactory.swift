//
//  CoordinatorFactory.swift
//  Services
//
//  Created by Andrey Panov on 21.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

class CoordinatorFactory {
    
    func createItemCoordinator(navController navController: UINavigationController? = nil) -> Coordinator {
        let coordinator = ItemCoordinator(router: router(navController),
                                         factory: ItemControllersFactory(),
                              coordinatorFactory: CoordinatorFactory())
        return coordinator
    }
    
    func createSettingsCoordinator(navController navController: UINavigationController? = nil) -> Coordinator {
        let coordinator = SettingsCoordinator(router: router(navController),
                                             factory: SettingsControllersFactory())
        return coordinator
    }
    
    func createItemCreationCoordinatorBox(navController navController: UINavigationController? = nil) ->
        (createCoordinator: ItemCreateCoordinator,
        controllerForPresent: UIViewController?) {
        let router = self.router(navController)
        let coordinator = ItemCreateCoordinator(router: router,
                                               factory: ItemCreateControllersFactory())
        return (coordinator, router.rootController)
    }
    
    func createAuthCoordinatorBox(navController navController: UINavigationController? = nil) ->
        (coordinator: Coordinator,
        output: AuthCoordinatorOutput,
        controllerForPresent: UIViewController?) {
            let router = self.router(navController)
            let coordinator = AuthCoordinator(router: router,
                                         factory: AuthControllersFactory())
        return (coordinator, coordinator, router.rootController)
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