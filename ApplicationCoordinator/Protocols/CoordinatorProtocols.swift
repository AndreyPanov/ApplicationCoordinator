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
    func start()
}

protocol FlowController: NSObjectProtocol {
    
    associatedtype T //enum Actions type
    var completionHandler: (T -> ())? {get set}
}