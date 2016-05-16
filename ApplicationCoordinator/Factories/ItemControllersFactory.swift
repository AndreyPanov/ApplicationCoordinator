//
//  ItemControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ItemControllersFactory {
    
    func createItemFlowOutput() -> (controller: UIViewController, output: ItemsFlowOutput) {
        let controller = ItemsListController.controllerFromStoryboard(.Items)
        return (controller, controller)
    }
    
    func createItemDetailController() -> ItemDetailController {
        return ItemDetailController.controllerFromStoryboard(.Items)
    }
}