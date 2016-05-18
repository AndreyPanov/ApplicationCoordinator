//
//  ApplicationCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ApplicationCoordinator: BaseCoordinator {
    
    var tabbarController: TabbarController
    var coordinatorFactory: CoordinatorFactory

    init(tabbarController: TabbarController,
         coordinatorFactory: CoordinatorFactory) {
        
        self.tabbarController = tabbarController
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        runItemCoordinator()
    }

    func runItemCoordinator() {
        /*
        if let navController = presenter.itemTabController() where navController.viewControllers.isEmpty {
            let itemCoordinator = ItemCoordinator(presenter: NavigationPresenter(rootController: navController))
            itemCoordinator.start()
            addDependancy(itemCoordinator)
        }*/
    }
    
    func runSettingsCoordinator() {
        /*
        if let navController = presenter.settingsTabController() where navController.viewControllers.isEmpty {
            let settingsCoordinator = SettingsCoordinator(presenter: NavigationPresenter(rootController: navController))
            settingsCoordinator.start()
            addDependancy(settingsCoordinator)
        }*/
    }
}
