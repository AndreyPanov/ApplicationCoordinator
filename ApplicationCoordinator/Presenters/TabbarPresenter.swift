//
//  TabbarPresenter.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

enum SelectedController {
    case First, Second
}

class TabbarPresenter: NSObject, Presenter, UITabBarControllerDelegate {
    
    typealias T = UITabBarController
    var navigationController: T?
    var tabbarHandler: SelectedController -> ()
    
    init(navigationController: T, tabbarHandler: SelectedController -> ()) {
        self.navigationController = navigationController
        self.tabbarHandler = tabbarHandler
        super.init()
        self.navigationController?.delegate = self
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        if tabBarController.selectedIndex == 0 {
            tabbarHandler(.First)
        }
        else if tabBarController.selectedIndex == 1 {
            tabbarHandler(.Second)
        }
    }
}
