//
//  TabbarPresenter.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class TabbarController: UITabBarController, UITabBarControllerDelegate, TabbarFlowOutput {
    
    var onItemFlowSelect: (UINavigationController -> ())?
    var onSettingsFlowSelect: (UINavigationController -> ())?
    var onViewDidLoad: (UINavigationController -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        if let controller = customizableViewControllers?.first as? UINavigationController {
            onViewDidLoad?(controller)
        }
    }

    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
        
        if selectedIndex == 0 {
            onItemFlowSelect?(controller)
        }
        else if selectedIndex == 1 {
            onSettingsFlowSelect?(controller)
        }
    }
}
