//
//  ItemCreateControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

class ItemCreateControllersFactory {
    
    func createItemsListController() -> ItemCreateController {
        return ItemCreateController.controllerFromStoryboard(.Create)
    }
}