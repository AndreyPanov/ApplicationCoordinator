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
    weak var presenter: NavigationPresenter?
    
    init(presenter: NavigationPresenter) {
        
        factory = ItemFactory()
        coordinatorFactory = CoordinatorFactory()
        self.presenter = presenter
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
        presenter?.push(itemListController, animated: false)
    }
    
    func showItemDetail(item: ItemList) {
        
        let itemDetailController = factory.createItemDetailController()
        itemDetailController.item = item
        itemDetailController.completionHandler = { result in
            /* continue the flow */
        }
        presenter?.push(itemDetailController)
    }
    
//MARK: - Run coordinators (switch to another flow)
    
    func runAuthCoordinator() {
        
        let authTuple = coordinatorFactory.createAuthCoordinatorTuple()
        let authCoordinator = authTuple.authCoordinator
        authCoordinator.flowCompletionHandler = { [weak self] in
            
            self?.presenter?.dismissController()
            self?.removeDependancy(authCoordinator)
            self?.showItemList()
        }
        
        addDependancy(authCoordinator)
        presenter?.present(authTuple.presenter.navigationController!)
        authCoordinator.start()
    }
    
    func runCreationCoordinator() {
        
        let creationTuple = coordinatorFactory.createItemCreationCoordinatorTuple()
        let creationCoordinator = creationTuple.createCoordinator
        creationCoordinator.flowCompletionHandler = { [weak self] in
            
            self?.presenter?.dismissController()
            self?.removeDependancy(creationCoordinator)
        }
        creationCoordinator.start()
        addDependancy(creationCoordinator)
        presenter?.present(creationTuple.presenter.navigationController!)
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

