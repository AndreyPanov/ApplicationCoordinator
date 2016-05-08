//
//  SettingsControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

class SettingsControllersFactory {
    
    func createSettingsController() -> SettingsController {
        return SettingsController.controllerFromStoryboard(.Settings)
    }
}