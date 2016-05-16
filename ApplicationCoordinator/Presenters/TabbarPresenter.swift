//
//  TabbarPresenter.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

enum SelectedController {
    case FirstTab, SecondTab
}

final class TabbarPresenter: NSObject, Presenter, UITabBarControllerDelegate {
    
    typealias ViewController = UITabBarController
    weak var rootController: ViewController?
    var tabbarHandler: SelectedController -> ()
    
    init(rootController: ViewController, tabbarHandler: SelectedController -> ()) {
        self.rootController = rootController
        self.tabbarHandler = tabbarHandler
        super.init()
        self.rootController?.delegate = self
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        if tabBarController.selectedIndex == 0 {
            tabbarHandler(.FirstTab)
        }
        else if tabBarController.selectedIndex == 1 {
            tabbarHandler(.SecondTab)
        }
    }
    
    func itemTabController() -> UINavigationController? {
        return rootController?.viewControllers?[0] as? UINavigationController
    }
    
    func settingsTabController() -> UINavigationController? {
        return rootController?.viewControllers?[1] as? UINavigationController
    }
}
