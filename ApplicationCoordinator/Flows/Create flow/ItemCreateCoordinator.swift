//
//  CreateCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

enum CreateActions {
    case Create, Hide
}

class ItemCreateCoordinator: BaseCoordinator {

    var factory: ItemCreateFactory
    
    override init(presenter: UINavigationController) {
        
        factory = ItemCreateFactory()
        super.init(presenter: presenter)
    }
    
    override func start() {
        showCreate()
    }
    
//MARK: - Run current flow's controllers
    
    func showCreate() {
        
        let createController = factory.createItemsListController()
        createController.completionHandler = { [weak self] result in
            
            if case CreateActions.Create = result {
                self?.dismissController()
            }
            else if case CreateActions.Hide = result {
                self?.dismissController()
            }
        }
        push(createController, animated: false)
    }
}

//MARK: - Factory

class ItemCreateFactory {
    
    func createItemsListController() -> ItemCreateController {
        return ItemCreateController.controllerFromStoryboard(.Create)
    }
}