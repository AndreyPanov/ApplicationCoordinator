//
//  ItemCoordinator.swift
//  Services
//
//  Created by Andrey Panov on 19.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

class ItemCoordinator: BaseCoordinator {

    var factory: ItemControllersFactory
    var coordinatorFactory: CoordinatorFactory
    var presenter: NavigationPresenter?
    
    init(presenter: NavigationPresenter) {
        
        factory = ItemControllersFactory()
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
        
        let itemFlow = factory.createItemsFlow()
        itemFlow.output.itemDidSelected = { [weak self] (item) in
            self?.showItemDetail(item)
        }
        itemFlow.output.onTapCreateButton = { [weak self] in
            self?.runCreationCoordinator()
        }
        presenter?.push(itemFlow.controller, animated: false)
    }
    
    func showItemDetail(item: ItemList) {
        
        let itemDetailFlow = factory.createItemDetailFlow()
        itemDetailFlow.input.itemList = item
        presenter?.push(itemDetailFlow.controller)
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
        presenter?.present(authTuple.presenter)
        authCoordinator.start()
    }
    
    func runCreationCoordinator() {
        
        let creationTuple = coordinatorFactory.createItemCreationCoordinatorTuple()
        let creationCoordinator = creationTuple.createCoordinator
        creationCoordinator.flowCompletionHandler = { [weak self] in
            
            self?.presenter?.dismissController()
            self?.removeDependancy(creationCoordinator)
        }
        addDependancy(creationCoordinator)
        presenter?.present(creationTuple.presenter)
        creationCoordinator.start()
    }
}