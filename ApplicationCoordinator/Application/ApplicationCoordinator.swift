//
//  ApplicationCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: BaseCoordinator {
    
    var tabbarFlowOutput: TabbarFlowOutput
    var coordinatorFactory: CoordinatorFactory

    init(tabbarFlowOutput: TabbarFlowOutput,
         coordinatorFactory: CoordinatorFactory) {
        
        self.tabbarFlowOutput = tabbarFlowOutput
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabbarFlowOutput.onViewDidLoad = runItemCoordinator()
        tabbarFlowOutput.onItemFlowSelect = runItemCoordinator()
        tabbarFlowOutput.onSettingsFlowSelect = runSettingsCoordinator()
    }
    
    func runItemCoordinator() -> ((UINavigationController) -> ()) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let itemCoordinatorBox = self.coordinatorFactory.createItemCoordinatorBox(navController: navController)
                itemCoordinatorBox.itemCoordinator.start()
                self.addDependancy(itemCoordinatorBox.itemCoordinator)
            }
        }
    }
    
    func runSettingsCoordinator() -> ((UINavigationController) -> ()) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let settingsCoordinatorBox = self.coordinatorFactory.createSettingsCoordinatorBox(navController: navController)
                settingsCoordinatorBox.settingsCoordinator.start()
                self.addDependancy(settingsCoordinatorBox.settingsCoordinator)
            }
        }
    }
}
