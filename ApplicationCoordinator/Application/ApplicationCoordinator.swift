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
    
    private func runItemCoordinator() -> ((UINavigationController) -> ()) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let itemCoordinator = self.coordinatorFactory.createItemCoordinator(navController: navController)
                itemCoordinator.start()
                self.addDependency(itemCoordinator)
            }
        }
    }
    
    private func runSettingsCoordinator() -> ((UINavigationController) -> ()) {
        return { navController in
            if navController.viewControllers.isEmpty == true {
                let settingsCoordinator = self.coordinatorFactory.createSettingsCoordinator(navController: navController)
                settingsCoordinator.start()
                self.addDependency(settingsCoordinator)
            }
        }
    }
}
