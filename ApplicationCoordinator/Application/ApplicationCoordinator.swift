//
//  ApplicationCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: BaseCoordinator {
    
    var tabbarController: TabbarController
    var coordinatorFactory: CoordinatorFactory

    init(tabbarController: TabbarController,
         coordinatorFactory: CoordinatorFactory) {
        
        self.tabbarController = tabbarController
        self.coordinatorFactory = coordinatorFactory
        super.init()
    }
    
    override func start() {
        tabbarController.onViewDidLoad = runItemCoordinator()
        tabbarController.onItemFlowSelect = runItemCoordinator()
        tabbarController.onSettingsFlowSelect = runSettingsCoordinator()
    }
    
    func runItemCoordinator() -> ((UINavigationController?) -> ()) {
        return { result in
            if result?.viewControllers.isEmpty == true {
                let itemCoordinatorBox = self.coordinatorFactory.createItemCoordinatorBox(navController: result)
                itemCoordinatorBox.itemCoordinator.start()
                self.addDependancy(itemCoordinatorBox.itemCoordinator)
            }
        }
    }
    
    func runSettingsCoordinator() -> ((UINavigationController?) -> ()) {
        return { result in
            if result?.viewControllers.isEmpty == true {
                let settingsCoordinatorBox = self.coordinatorFactory.createSettingsCoordinatorBox(navController: result)
                settingsCoordinatorBox.settingsCoordinator.start()
                self.addDependancy(settingsCoordinatorBox.settingsCoordinator)
            }
        }
    }
}
