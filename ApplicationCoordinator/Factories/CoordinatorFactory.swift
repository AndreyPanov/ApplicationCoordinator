//
//  CoordinatorFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 24/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    
    func makeItemCoordinator(navController: UINavigationController?) -> Coordinator
    func makeItemCoordinator() -> Coordinator
    
    func makeSettingsCoordinator() -> Coordinator
    func makeSettingsCoordinator(navController: UINavigationController?) -> Coordinator
    
    func makeItemCreationCoordinatorBox() ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: Presentable?)
    
    func makeItemCreationCoordinatorBox(navController: UINavigationController?) ->
        (configurator: Coordinator & ItemCreateCoordinatorOutput,
        toPresent: Presentable?)
    
    func makeAuthCoordinatorBox() ->
        (configurator: Coordinator & AuthCoordinatorOutput,
        toPresent: Presentable?)
    
    func makeAuthCoordinatorBox(navController: UINavigationController?) ->
        (configurator: Coordinator & AuthCoordinatorOutput,
        toPresent: Presentable?)
}
