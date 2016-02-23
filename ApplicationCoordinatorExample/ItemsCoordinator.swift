//
//  ItemsCoordinator.swift
//  ApplicationCoordinatorExample
//
//  Created by Andrey Panov on 22.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

enum ItemAction {
    case OpenDetail(String)
}

class ItemsCoordinator: NSObject, Coordinatable {

    private(set) var rootController: UINavigationController
    private(set) lazy var childCoorditators: [Coordinatable] = []
    var complitionHandler:ComplitionBlock?
    
    required init(rootController: UINavigationController) {
        
        self.rootController = rootController
        super.init()
    }
    
    func start() {
        
        let itemListController = ItemsListController.controllerFromStoryboard(.Items)
        itemListController.complitionHandler = { action in
            switch (action) {
            case .OpenDetail(let item):
                self.pushItemDetail(item)
            }
        }
        rootController.setViewControllers([itemListController], animated: false)
    }
}

private extension ItemsCoordinator {
    
    func pushItemDetail(item: String) {
        
        let itemDetailController = ItemDetailController.controllerFromStoryboard(.Items)
        itemDetailController.complitionHandler = { action in
            print("some...")
        }
        itemDetailController.item = item
        rootController.pushViewController(itemDetailController, animated: true)
    }
}
