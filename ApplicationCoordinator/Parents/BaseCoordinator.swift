//
//  BaseCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 28.04.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//
import Foundation
import UIKit

class BaseCoordinator: Coordinator {
    
    var flowCompletionHandler:CoordinatorHandler?
    var childCoordinators: [Coordinator] = []

    func start() {
        fatalError("must be overriden")
    }
    
    func addDependancy(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeDependancy(coordinator: Coordinator) {
        guard childCoordinators.isEmpty == false else { return }
        
        for (index, element) in childCoordinators.enumerate() {
            if unsafeAddressOf(element) == unsafeAddressOf(coordinator) {
                childCoordinators.removeAtIndex(index)
            }
        }
    }
}
