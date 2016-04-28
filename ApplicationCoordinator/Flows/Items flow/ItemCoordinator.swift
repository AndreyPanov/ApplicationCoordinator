//
//  ItemCoordinator.swift
//  Services
//
//  Created by Панов Андрей on 19.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

enum ItemListActions {
    case ItemSelect(ItemList), Create
}

class ItemCoordinator: BaseCoordinator {

    var factory: ItemFactory
    var coordinatorFactory: CoordinatorFactory
    
    override init(presenter: UINavigationController) {
        
        factory = ItemFactory()
        coordinatorFactory = CoordinatorFactory()
        super.init(presenter: presenter)
    }
    
    override func start() {
        
        // Just example
        // In real project we would be call some AuthManager and check user valid session.
        let isUserAuth = false
        if isUserAuth {
            showItemList()
        } else {
            dispatch_async(dispatch_get_main_queue(), {
                self.runAuthCoordinator()
            })
        }
    }
    
//MARK: - Run current flow's controllers
    
    func showItemList() {
        
        let itemListController = factory.createItemsListController()
        itemListController.completionHandler = { [weak self] result in
            
            if case let ItemListActions.ItemSelect(list) = result {
                self?.showItemDetail(list)
            }
            else if case ItemListActions.Create = result {
                self?.runCreationCoordinator()
            }
        }
        push(itemListController, animated: false)
    }
    
    func showItemDetail(item: ItemList) {
        
        let itemDetailController = factory.createItemDetailController()
        itemDetailController.item = item
        itemDetailController.completionHandler = { result in
            /* continue the flow */
        }
        push(itemDetailController)
    }
    
//MARK: - Run coordinators (switch to another flow)
    
    func runAuthCoordinator() {
        
        let authTuple = coordinatorFactory.createAuthCoordinatorTuple()
        let authCoordinator = authTuple.authCoordinator
        authCoordinator.flowCompletionHandler = { [unowned self] in
            
            self.dismiss()
            self.removeDependancy(authCoordinator)
            self.showItemList()
        }
        authCoordinator.start()
        addDependancy(authCoordinator)
        present(authTuple.presenter)
    }
    
    func runCreationCoordinator() {
        
        let creationTuple = coordinatorFactory.createItemCreationCoordinatorTuple()
        let creationCoordinator = creationTuple.createCoordinator
        creationCoordinator.flowCompletionHandler = { [unowned self] in
            
            self.dismiss()
            self.removeDependancy(creationCoordinator)
        }
        creationCoordinator.start()
        addDependancy(creationCoordinator)
        present(creationTuple.presenter)
    }
}

//MARK: - Factory

class ItemFactory {
    
    func createItemsListController() -> ItemsListController {
        return ItemsListController.controllerFromStoryboard(.Items)
    }
    
    func createItemDetailController() -> ItemDetailController {
        return ItemDetailController.controllerFromStoryboard(.Items)
    }
}

