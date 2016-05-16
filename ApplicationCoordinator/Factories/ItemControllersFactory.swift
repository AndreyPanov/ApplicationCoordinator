//
//  ItemControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ItemControllersFactory {
    
    func createItemsFlow() -> (controller: UIViewController, output: ItemsFlowOutput) {
        let controller = ItemsListController.controllerFromStoryboard(.Items)
        return (controller, controller)
    }
    
    func createItemDetailFlow() -> (
        controller: UIViewController,
        input: ItemDetailFlowInput,
        output: ItemDetailFlowOutput) {
            
            let controller = ItemDetailController.controllerFromStoryboard(.Items)
            return (controller, controller, controller)
    }
}