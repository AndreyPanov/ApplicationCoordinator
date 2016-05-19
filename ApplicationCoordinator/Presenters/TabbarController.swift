//
//  TabbarPresenter.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

protocol TabbarFlowOutput {
    
    var onItemFlowSelect: (UINavigationController? -> ())? { get set }
    var onSettingsFlowSelect: (UINavigationController? -> ())? { get set }
    var onViewDidLoad: (UINavigationController? -> ())? { get set }
}

final class TabbarController: UITabBarController, UITabBarControllerDelegate, TabbarFlowOutput {
    
    var onItemFlowSelect: (UINavigationController? -> ())?
    var onSettingsFlowSelect: (UINavigationController? -> ())?
    var onViewDidLoad: (UINavigationController? -> ())?
    
    override func viewDidLoad() {
        delegate = self
        onViewDidLoad?(selectedViewController as? UINavigationController)
    }

    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        if tabBarController.selectedIndex == 0 {
            onItemFlowSelect?(viewControllers?[0] as? UINavigationController)
            //tabbarHandler(.FirstTab)
        }
        else if tabBarController.selectedIndex == 1 {
            //tabbarHandler(.SecondTab)
            onSettingsFlowSelect?(viewControllers?[0] as? UINavigationController)
        }
    }
    
    func itemTabController() -> UINavigationController? {
        return viewControllers?[0] as? UINavigationController
    }
    
    func settingsTabController() -> UINavigationController? {
        return viewControllers?[1] as? UINavigationController
    }
}
