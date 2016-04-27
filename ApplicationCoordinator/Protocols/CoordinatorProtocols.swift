//
//  FlowRouter.swift
//  Services
//
//  Created by Панов Андрей on 23.03.16.
//  Copyright © 2016 Avito. All rights reserved.
//

import Foundation

typealias CoordinatorHandler = () -> ()

protocol Coordinatable: NSObjectProtocol, Router {
    
    var flowCompletionHandler: CoordinatorHandler? {get set}
    var childCoordinators: [Coordinatable] {get set}
    func start()
    func addDependancy(coordinator: Coordinatable)
    func removeDependancy(coordinator: Coordinatable)
}

extension Coordinatable {
    
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

protocol FlowController: NSObjectProtocol {
    
    associatedtype T //enum Actions type
    var completionHandler: (T -> ())? {get set}
}