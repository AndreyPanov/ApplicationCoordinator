//
//  SettingsCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

enum SettingsActions {
}

class SettingsCoordinator: BaseCoordinator {

    var factory: SettingsFactory
    weak var presenter: NavigationPresenter?
    
    init(presenter: NavigationPresenter) {
        
        factory = SettingsFactory()
        self.presenter = presenter
    }
    
    override func start() {
        showSettings()
    }
    
    //MARK: - Run current flow's controllers
    
    func showSettings() {
        
        let settingsController = factory.createSettingsController()
        settingsController.completionHandler = { result in
            /* continue the flow */
        }
        presenter?.push(settingsController, animated: false)
    }
}

//MARK: - Factory

class SettingsFactory {
    
    func createSettingsController() -> SettingsController {
        return SettingsController.controllerFromStoryboard(.Settings)
    }
}