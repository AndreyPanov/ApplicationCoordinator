//
//  ApplicationCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: BaseCoordinator {
    
    var tabbarView: TabbarView
    let coordinatorFactory: CoordinatorFactory

    init(tabbarView: TabbarView,
         coordinatorFactory: CoordinatorFactory) {
        
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabbarView.onViewDidLoad = runItemCoordinator()
        tabbarView.onItemFlowSelect = runItemCoordinator()
        tabbarView.onSettingsFlowSelect = runSettingsCoordinator()
    }
    
    fileprivate func runItemCoordinator() -> ((UINavigationController) -> ()) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let itemCoordinator = self.coordinatorFactory.makeItemCoordinator(navController: navController)
                itemCoordinator.start()
                self.addDependency(itemCoordinator)
            }
        }
    }
    
    fileprivate func runSettingsCoordinator() -> ((UINavigationController) -> ()) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator(navController: navController)
                settingsCoordinator.start()
                self.addDependency(settingsCoordinator)
            }
        }
    }
}
