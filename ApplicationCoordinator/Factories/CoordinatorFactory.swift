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
        (coordinator: Coordinator,
        output: ItemCreateCoordinatorOutput,
        controllerForPresent: UIViewController?)
    
    func createItemCreationCoordinatorBox(navController navController: UINavigationController?) ->
        (coordinator: Coordinator,
        output: ItemCreateCoordinatorOutput,
        controllerForPresent: UIViewController?)
    
    func createAuthCoordinatorBox() ->
        (coordinator: Coordinator,
        output: AuthCoordinatorOutput,
        controllerForPresent: UIViewController?)
    
    func createAuthCoordinatorBox(navController navController: UINavigationController?) ->
        (coordinator: Coordinator,
        output: AuthCoordinatorOutput,
        controllerForPresent: UIViewController?)
}