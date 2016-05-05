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
    
    typealias ViewController = UITabBarController
    var rootController: ViewController?
    var tabbarHandler: SelectedController -> ()
    
    init(rootController: ViewController, tabbarHandler: SelectedController -> ()) {
        self.rootController = rootController
        self.tabbarHandler = tabbarHandler
        super.init()
        self.rootController?.delegate = self
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
