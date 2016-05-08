//
//  ApplicationCoordinator.swift
//  ApplicationCoordinatorExample
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ApplicationCoordinator: BaseCoordinator {
    
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

    init(presenter: UITabBarController) {
        self.tabbar = presenter
    }
    
    override func start() {
        runItemCoordinator()
    }

    func runItemCoordinator() {
        
        if coordinatorStarted(ItemCoordinator) == false {
            if let navController = presenter.itemTabController() {
                let itemCoordinator = ItemCoordinator(presenter: NavigationPresenter(rootController: navController))
                itemCoordinator.start()
                addDependancy(itemCoordinator)
            }
        }
    }
    
    func runSettingsCoordinator() {
        
        if coordinatorStarted(SettingsCoordinator) == false {
            
            if let navController = presenter.settingsTabController() {
                let settingsCoordinator = SettingsCoordinator(presenter: NavigationPresenter(rootController: navController))
                settingsCoordinator.start()
                addDependancy(settingsCoordinator)
            }
        }
    }
}
