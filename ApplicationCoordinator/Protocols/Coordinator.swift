//
//  Coordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import Foundation

typealias CoordinatorHandler = () -> ()

protocol Coordinator: class {
    
    var flowCompletionHandler: CoordinatorHandler? {get set}
    func start()
}