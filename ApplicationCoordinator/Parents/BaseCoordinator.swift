//
//  BaseCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 28.04.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//
import Foundation
import UIKit

class BaseCoordinator: Coordinatable {
    
    var flowCompletionHandler:CoordinatorHandler?
    var childCoordinators: [Coordinatable] = []
    private(set) weak var presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        fatalError("must be overriden")
    }
    
    func addDependancy(coordinator: Coordinatable) {
        childCoordinators.append(coordinator)
    }
    
    func removeDependancy(coordinator: Coordinatable) {
        guard childCoordinators.isEmpty == false else { return }
        
        for (index, element) in childCoordinators.enumerate() {
            if unsafeAddressOf(element) == unsafeAddressOf(coordinator) {
                childCoordinators.removeAtIndex(index)
            }
        }
    }
}
