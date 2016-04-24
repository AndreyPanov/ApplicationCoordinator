//
//  ApplicationCoordinator.swift
//  ApplicationCoordinatorExample
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit


class ApplicationCoordinator: NSObject, UITabBarControllerDelegate {
    
    private(set) var presenter: UITabBarController
    var itemCoordinator: ItemCoordinator?
    var settingsCoordinator: SettingsCoordinator?

    init(presenter: UITabBarController) {
        
        self.presenter = presenter
        super.init()
        self.presenter.delegate = self
    }
    
    func start() {
        runItemCoordinator()
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        if tabBarController.selectedIndex == 0 {
            runItemCoordinator()
        }
        else if tabBarController.selectedIndex == 1 {
            runSettingsCoordinator()
        }
    }

    
    func runItemCoordinator() {
        
        if itemCoordinator == nil {
            if let navController = presenter.viewControllers?[0] as? UINavigationController {
                itemCoordinator = ItemCoordinator(presenter: navController)
                itemCoordinator?.start()
                print("ItemCoordinator start")
            }
        }
    }
    
    func runSettingsCoordinator() {
        
        if settingsCoordinator == nil {
            if let navController = presenter.viewControllers?[1] as? UINavigationController {
                settingsCoordinator = SettingsCoordinator(presenter: navController)
                settingsCoordinator?.start()
                print("SettingsCoordinator start")
            }
        }
    }
}
