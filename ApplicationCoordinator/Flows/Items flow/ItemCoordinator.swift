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
    var router: Router
    
    init(router: Router,
         factory: ItemControllersFactory,
         coordinatorFactory: CoordinatorFactory) {
        
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showItemList()
    }
    
//MARK: - Run current flow's controllers
    
    func showItemList() {
      
        let itemFlowBox = factory.createItemsBox()
        itemFlowBox.output.authNeed = { [weak self] in
            self?.runAuthCoordinator()
        }
        itemFlowBox.output.onItemSelect = { [weak self] (item) in
            self?.showItemDetail(item)
        }
        itemFlowBox.output.onCreateButtonTap = { [weak self] in
            self?.runCreationCoordinator()
        }
        router.push(itemFlowBox.controller, animated: false)
    }
    
    func showItemDetail(item: ItemList) {
        
        let itemDetailFlowBox = factory.createItemDetailBox()
        itemDetailFlowBox.input.itemList = item
        router.push(itemDetailFlowBox.controller)
    }
    
//MARK: - Run coordinators (switch to another flow)
    
    func runAuthCoordinator() {
        let authFlowBox = coordinatorFactory.createAuthCoordinatorBox()
        authFlowBox.authCoordinator.finishFlow = { [weak self] in
            self?.router.dismissController()
            self?.removeDependancy(authFlowBox.authCoordinator)
        }
        addDependancy(authFlowBox.authCoordinator)
        router.present(authFlowBox.router.rootController, animated: false)
        authFlowBox.authCoordinator.start()
    }
    
    func runCreationCoordinator() {
        
        let creationBox = coordinatorFactory.createItemCreationCoordinatorBox()
        creationBox.createCoordinator.finishFlow = { [weak self] in
            
            self?.router.dismissController()
            self?.removeDependancy(creationBox.createCoordinator)
        }
        addDependancy(creationBox.createCoordinator)
        router.present(creationBox.router.rootController)
        creationBox.createCoordinator.start()
    }
}