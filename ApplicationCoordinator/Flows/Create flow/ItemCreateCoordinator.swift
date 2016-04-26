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

class ItemCreateCoordinator: NSObject, Coordinatable {

    var flowCompletionHandler:CoordinatorHandler?
    var factory: ItemCreateFactory
    private(set) weak var presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        
        self.presenter = presenter
        factory = ItemCreateFactory()
        super.init()
    }
    
    func start() {
        showCreate()
    }
    
//MARK: - Run current flow's controllers
    
    func showCreate() {
        
        let createController = factory.createItemsListController()
        createController.completionHandler = { [weak self] result in
            
            if case CreateActions.Create = result {
                self?.dismiss()
            }
            else if case CreateActions.Hide = result {
                self?.dismiss()
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