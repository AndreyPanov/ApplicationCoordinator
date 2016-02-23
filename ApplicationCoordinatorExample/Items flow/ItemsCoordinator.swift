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
    var completionHandler:CompletionBlock?
    
    required init(rootController: UINavigationController) {
        
        self.rootController = rootController
        super.init()
    }
    
    func start() {
        
        let itemListController = ItemsListController.controllerFromStoryboard(.Items)
        itemListController.completionHandler = { [unowned self] action in
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
        itemDetailController.completionHandler = { action in
            print("some...")
        }
        itemDetailController.item = item
        rootController.pushViewController(itemDetailController, animated: true)
    }
}
