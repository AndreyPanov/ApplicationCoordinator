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

    func start() { }
    
    // add only unique object
    func addDependancy(coordinator: Coordinator) {
        
        for element in childCoordinators {
            if ObjectIdentifier(element) == ObjectIdentifier(coordinator) { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependancy(coordinator: Coordinator) {
        guard childCoordinators.isEmpty == false else { return }
        
        for (index, element) in childCoordinators.enumerate() {
            if ObjectIdentifier(element) == ObjectIdentifier(coordinator) {
                childCoordinators.removeAtIndex(index)
                break
            }
        }
    }
}