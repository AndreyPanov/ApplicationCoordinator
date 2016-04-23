//
//  RootTabbarController.swift
//  ApplicationCoordinatorExample
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//
import UIKit

class RootTabbarController: UITabBarController, UITabBarControllerDelegate {
    
    var itemCoordinator: ItemCoordinator?
    var settingsCoordinator: SettingsCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        runItemCoordinator()
        delegate = self
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        if selectedIndex == 0 {
            runItemCoordinator()
        }
        else if selectedIndex == 1 {
            runSettingsCoordinator()
        }
    }
    
    func runItemCoordinator() {
        
        if itemCoordinator == nil {
            if let navController = viewControllers?[0] as? UINavigationController {
                itemCoordinator = ItemCoordinator(presenter: navController)
                itemCoordinator?.start()
                print("ItemCoordinator start")
            }
        }
    }
    
    func runSettingsCoordinator() {
        
        if settingsCoordinator == nil {
            if let navController = viewControllers?[1] as? UINavigationController {
                settingsCoordinator = SettingsCoordinator(presenter: navController)
                settingsCoordinator?.start()
                print("SettingsCoordinator start")
            }
        }
    }
}
