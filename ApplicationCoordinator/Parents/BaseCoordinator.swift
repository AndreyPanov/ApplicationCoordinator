//
//  BaseCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 28.04.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//
import Foundation
import UIKit

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []

    func start() {
        assertionFailure("must be overriden")
    }
    
    // add only unique object
    func addDependency(coordinator: Coordinator) {
        
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(coordinator: Coordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        for (index, element) in childCoordinators.enumerate() {
            if element === coordinator {
                childCoordinators.removeAtIndex(index)
                break
            }
        }
    }
}