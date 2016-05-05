//
//  ApplicationCoordinator.swift
//  ApplicationCoordinatorExample
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    var tabbar: UITabBarController
    lazy var presenter: TabbarPresenter = {
        return TabbarPresenter(rootController: self.tabbar, tabbarHandler: { [weak self] result in
            switch result {
            case .First:
                self?.runItemCoordinator()
            case .Second:
                self?.runSettingsCoordinator()
            }
        })
    }()
    var flowCompletionHandler: CoordinatorHandler?
    
    var itemCoordinator: ItemCoordinator?
    var settingsCoordinator: SettingsCoordinator?

    init(presenter: UITabBarController) {
        self.tabbar = presenter
    }
    
    func start() {
        runItemCoordinator()
    }

    func runItemCoordinator() {
        
        if itemCoordinator == nil {
            if let navController = presenter.rootController?.viewControllers?[0] as? UINavigationController {
                itemCoordinator = ItemCoordinator(presenter: NavigationPresenter(rootController: navController))
                itemCoordinator?.start()
            }
        }
    }
    
    func runSettingsCoordinator() {
        
        if settingsCoordinator == nil {
            if let navController = presenter.rootController?.viewControllers?[1] as? UINavigationController {
                settingsCoordinator = SettingsCoordinator(presenter: NavigationPresenter(rootController: navController))
                settingsCoordinator?.start()
            }
        }
    }
}
