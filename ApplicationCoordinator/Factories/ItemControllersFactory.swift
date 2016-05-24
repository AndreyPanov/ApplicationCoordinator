//
//  ItemControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ItemControllersFactory {
    
    func createItemsBox() ->
        (controllerForPresent: UIViewController,
        output: ItemsFlowOutput) {
        let controller = ItemsListController.controllerFromStoryboard(.Items)
        return (controller, controller)
    }
    
    func createItemDetailBox(item item: ItemList) ->
        (controllerForPresent: UIViewController,
        output: ItemDetailFlowOutput) {
            
            let controller = ItemDetailController.controllerFromStoryboard(.Items)
            controller.itemList = item
            return (controller, controller)
    }
}