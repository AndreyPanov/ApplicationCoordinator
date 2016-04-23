//
//  CreateCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ItemCreateCoordinator: NSObject, Coordinatable {

    var flowCompletionHandler:CoordinatorHandler?
    var factory: ItemFactory
    private(set) weak var presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        
        self.presenter = presenter
        factory = ItemFactory()
    }
    
    func start() {
        
    }
}
