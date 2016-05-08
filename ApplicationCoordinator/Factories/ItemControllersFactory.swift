//
//  ItemControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

class ItemControllersFactory {
    
    func createItemsListController() -> ItemsListController {
        return ItemsListController.controllerFromStoryboard(.Items)
    }
    
    func createItemDetailController() -> ItemDetailController {
        return ItemDetailController.controllerFromStoryboard(.Items)
    }
}