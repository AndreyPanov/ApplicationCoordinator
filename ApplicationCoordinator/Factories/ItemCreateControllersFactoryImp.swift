//
//  ItemCreateControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ItemCreateControllersFactoryImp: ItemCreateControllersFactory {
    
    func createItemAddBox() ->
        (controllerForPresent: UIViewController,
        output: ItemCreateFlowOutput) {
            
            let controller = ItemCreateController.controllerFromStoryboard(.Create)
            return (controller, controller)
    }
}