//
//  ItemCoordinator.swift
//  Services
//
//  Created by Andrey Panov on 19.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

final class ItemCoordinator: BaseCoordinator {

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
    
    private func showItemList() {
      
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
        router.push(itemFlowBox.controllerForPresent, animated: false)
    }
    
    private func showItemDetail(item: ItemList) {
        
        let itemDetailFlowBox = factory.createItemDetailBox(item: item)
        router.push(itemDetailFlowBox.controllerForPresent)
    }
    
//MARK: - Run coordinators (switch to another flow)
    
    private func runAuthCoordinator() {
        var authFlowBox = coordinatorFactory.createAuthCoordinatorBox()
        authFlowBox.output.finishFlow = { [weak self] in
            self?.router.dismissController()
            self?.removeDependancy(authFlowBox.coordinator)
        }
        addDependancy(authFlowBox.coordinator)
        router.present(authFlowBox.controllerForPresent, animated: false)
        authFlowBox.coordinator.start()
    }
    
    private func runCreationCoordinator() {
        
        var creationBox = coordinatorFactory.createItemCreationCoordinatorBox()
        creationBox.output.finishFlow = { [weak self] in
            
            self?.router.dismissController()
            self?.removeDependancy(creationBox.coordinator)
        }
        addDependancy(creationBox.coordinator)
        router.present(creationBox.controllerForPresent)
        creationBox.coordinator.start()
    }
}