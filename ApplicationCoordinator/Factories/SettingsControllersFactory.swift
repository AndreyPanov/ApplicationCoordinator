//
//  SettingsControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class SettingsControllersFactory {
    
    func createSettingsBox() -> (controllerForPresent: UIViewController, output: SettingsFlowOutput) {
        let controller = SettingsController.controllerFromStoryboard(.Settings)
        return (controller, controller)
    }
}