//
//  ItemsCoordinator.swift
//  ApplicationCoordinatorExample
//
//  Created by Панов Андрей on 22.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ItemsCoordinator: NSObject, Coordinatable {

    private(set) var rootController: UINavigationController
    private(set) lazy var childCoorditators: [Coordinatable] = []
    
    required init(rootController: UINavigationController) {
        
        self.rootController = rootController
        super.init()
    }
    
    func start() {
        
    }
}
