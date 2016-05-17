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
    var presenterBox: PresenterBox
    
    init(presenterBox: PresenterBox,
         factory: ItemControllersFactory,
         coordinatorFactory: CoordinatorFactory) {
        
        self.presenterBox = presenterBox
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
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
        
        let itemFlowBox = factory.createItemsBox()
        itemFlowBox.output.onItemSelect = { [weak self] (item) in
            self?.showItemDetail(item)
        }
        itemFlowBox.output.onCreateButtonTap = { [weak self] in
            self?.runCreationCoordinator()
        }
        presenterBox.presenter()?.push(itemFlowBox.controller, animated: false)
    }
    
    func showItemDetail(item: ItemList) {
        
        let itemDetailFlowBox = factory.createItemDetailBox()
        itemDetailFlowBox.input.itemList = item
        presenterBox.presenter()?.push(itemDetailFlowBox.controller)
    }
    
//MARK: - Run coordinators (switch to another flow)
    
    func runAuthCoordinator() {
        
        let authTuple = coordinatorFactory.createAuthCoordinatorTuple()
        let authCoordinator = authTuple.authCoordinator
        authCoordinator.flowCompletionHandler = { [weak self] in
            
            self?.presenterBox.presenter()?.dismissController()
            self?.removeDependancy(authCoordinator)
            self?.showItemList()
        }
        
        addDependancy(authCoordinator)
        presenterBox.presenter()?.present(authTuple.presenter)
        authCoordinator.start()
    }
    
    func runCreationCoordinator() {
        
        let creationTuple = coordinatorFactory.createItemCreationCoordinatorTuple()
        let creationCoordinator = creationTuple.createCoordinator
        creationCoordinator.flowCompletionHandler = { [weak self] in
            
            self?.presenterBox.presenter()?.dismissController()
            self?.removeDependancy(creationCoordinator)
        }
        addDependancy(creationCoordinator)
        presenterBox.presenter()?.present(creationTuple.presenter)
        creationCoordinator.start()
    }
}