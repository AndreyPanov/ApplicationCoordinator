//
//  CoordinatorFactory.swift
//  Services
//
//  Created by Andrey Panov on 21.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

class CoordinatorFactory {
    
    func createItemCoordinatorBox(navController navController: UINavigationController?) -> (itemCoordinator: ItemCoordinator, router: Router) {
        
        let navController = (navController != nil) ? navController! : createNavigationController()
        let router = RouterImp(rootController: navController)
        let coordinator = ItemCoordinator(router: router,
                                          factory: ItemControllersFactory(),
                                          coordinatorFactory: CoordinatorFactory())
        return (coordinator, router)
    }
    
    func createSettingsCoordinatorBox(navController navController: UINavigationController?) -> (settingsCoordinator: SettingsCoordinator, router: Router) {
        
        let navController = (navController != nil) ? navController! : createNavigationController()
        let router = RouterImp(rootController: navController)
        let coordinator = SettingsCoordinator(router: router,
                                          factory: SettingsControllersFactory())
        return (coordinator, router)
    }
    /*
    func createItemCreationCoordinatorBox() -> (createCoordinator: ItemCreateCoordinator, presenter: NavigationPresenter) {
        
        let presenter = NavigationPresenter(rootController: createNavigationController())
        return (ItemCreateCoordinator(presenter: presenter), presenter)
    }
    
    func createAuthCoordinatorBox() -> (authCoordinator: AuthCoordinator, presenter: NavigationPresenter) {
        
        let presenter = NavigationPresenter(rootController: createNavigationController())
        return (AuthCoordinator(presenter: presenter), presenter)
    }
    */
    private func createNavigationController() -> UINavigationController {
        return UINavigationController.controllerFromStoryboard(.Main)
    }
}