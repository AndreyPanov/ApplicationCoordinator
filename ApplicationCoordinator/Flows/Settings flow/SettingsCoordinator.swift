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

class SettingsCoordinator: NSObject, Coordinatable {

    var flowCompletionHandler:CoordinatorHandler?
    var factory: SettingsFactory
    private(set) weak var presenter: UINavigationController?
    var childCoordinators: [Coordinatable] = []
    
    init(presenter: UINavigationController) {
        
        self.presenter = presenter
        factory = SettingsFactory()
        super.init()
    }
    
    func start() {
        showSettings()
    }
    
    //MARK: - Run current flow's controllers
    
    func showSettings() {
        
        let settingsController = factory.createSettingsController()
        settingsController.completionHandler = { result in
            /* continue the flow */
        }
        push(settingsController, animated: false)
    }
}

//MARK: - Factory

class SettingsFactory {
    
    func createSettingsController() -> SettingsController {
        return SettingsController.controllerFromStoryboard(.Settings)
    }
}