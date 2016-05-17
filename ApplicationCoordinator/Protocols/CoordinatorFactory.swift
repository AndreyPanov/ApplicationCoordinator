//
//  CoordinatorFactory.swift
//  Services
//
//  Created by Andrey Panov on 21.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

class CoordinatorFactory {
    
    func createItemCoordinatorTuple() -> (creationCoordinator: ItemCoordinator, presenterBox: PresenterBox) {
        
        let navController = createNavigationController()
        let presenterBox: PresenterBox = .init(navigationPresenter: NavigationPresenter(rootController: navController))
        let coordinator = ItemCoordinator(presenterBox: presenterBox,
                                          factory: ItemControllersFactory(),
                                          coordinatorFactory: CoordinatorFactory())
        return (coordinator, presenterBox)
    }
    
    func createItemCreationCoordinatorTuple() -> (createCoordinator: ItemCreateCoordinator, presenter: NavigationPresenter) {
        
        let presenter = NavigationPresenter(rootController: createNavigationController())
        return (ItemCreateCoordinator(presenter: presenter), presenter)
    }
    
    func createAuthCoordinatorTuple() -> (authCoordinator: AuthCoordinator, presenter: NavigationPresenter) {
        
        let presenter = NavigationPresenter(rootController: createNavigationController())
        return (AuthCoordinator(presenter: presenter), presenter)
    }
    
    private func createNavigationController() -> UINavigationController {
        return UINavigationController.controllerFromStoryboard(.Main)
    }
}