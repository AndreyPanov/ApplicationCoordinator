//
//  RootTabbarController.swift
//  ApplicationCoordinatorExample
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//
import UIKit

class RootTabbarController: UITabBarController {
    
    var itemCoordinator: ItemCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        runItemCoordinator()
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        if selectedIndex == 0 {
            runItemCoordinator()
        }
    }
    
    func runItemCoordinator() {
        
        if itemCoordinator == nil {
            if let navController = viewControllers?[0] as? UINavigationController {
                itemCoordinator = ItemCoordinator(presenter: navController)
                itemCoordinator?.start()
            }
        }
    }
}
