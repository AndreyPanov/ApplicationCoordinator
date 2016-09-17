//
//  CoordinatorFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 24/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    
    func createItemCoordinator(navController: UINavigationController?) -> Coordinator
    func createItemCoordinator() -> Coordinator
    
    func createSettingsCoordinator() -> Coordinator
    func createSettingsCoordinator(navController: UINavigationController?) -> Coordinator
    
    func createItemCreationCoordinatorBox() ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: UIViewController?)
    
    func createItemCreationCoordinatorBox(navController: UINavigationController?) ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: UIViewController?)
    
    func createAuthCoordinatorBox() ->
        (configurator: Coordinator & AuthCoordinatorOutput,
        toPresent: UIViewController?)
    
    func createAuthCoordinatorBox(navController: UINavigationController?) ->
        (configurator: Coordinator & AuthCoordinatorOutput,
        toPresent: UIViewController?)
}
