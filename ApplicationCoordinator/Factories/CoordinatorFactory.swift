//
//  CoordinatorFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 24/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    
    func createItemCoordinator(navController navController: UINavigationController?) -> Coordinator
    func createItemCoordinator() -> Coordinator
    
    func createSettingsCoordinator() -> Coordinator
    func createSettingsCoordinator(navController navController: UINavigationController?) -> Coordinator
    
    func createItemCreationCoordinatorBox() ->
        (configurator: protocol<Coordinator, ItemCreateCoordinatorOutput>,
        toPresent: UIViewController?)
    
    func createItemCreationCoordinatorBox(navController navController: UINavigationController?) ->
        (configurator: protocol<Coordinator, ItemCreateCoordinatorOutput>,
        toPresent: UIViewController?)
    
    func createAuthCoordinatorBox() ->
        (configurator: protocol<Coordinator, AuthCoordinatorOutput>,
        toPresent: UIViewController?)
    
    func createAuthCoordinatorBox(navController navController: UINavigationController?) ->
        (configurator: protocol<Coordinator, AuthCoordinatorOutput>,
        toPresent: UIViewController?)
}