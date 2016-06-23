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
      
        let itemsOutput = factory.createItemsOutput()
        itemsOutput.authNeed = { [weak self] in
            self?.runAuthCoordinator()
        }
        itemsOutput.onItemSelect = { [weak self] (item) in
            self?.showItemDetail(item)
        }
        itemsOutput.onCreateButtonTap = { [weak self] in
            self?.runCreationCoordinator()
        }
        router.push(itemsOutput.toPresent(), animated: false)
    }
    
    private func showItemDetail(item: ItemList) {
        
        let itemDetailFlowOutput = factory.createItemDetailOutput(item: item)
        router.push(itemDetailFlowOutput.toPresent())
    }
    
//MARK: - Run coordinators (switch to another flow)
    
    private func runAuthCoordinator() {
        var authFlowBox = coordinatorFactory.createAuthCoordinatorBox()
        let coordinator = authFlowBox.coordinator
        authFlowBox.output.finishFlow = { [weak self, weak coordinator] in
            self?.router.dismissController()
            self?.removeDependancy(coordinator)
        }
        addDependancy(authFlowBox.coordinator)
        router.present(authFlowBox.controllerForPresent, animated: false)
        authFlowBox.coordinator.start()
    }
    
    private func runCreationCoordinator() {
        
        var creationBox = coordinatorFactory.createItemCreationCoordinatorBox()
        let coordinator = creationBox.coordinator
        creationBox.output.finishFlow = { [weak self, weak coordinator] item in
            
            self?.router.dismissController()
            self?.removeDependancy(coordinator)
            if let item = item {
                self?.showItemDetail(item)
            }
        }
        addDependancy(creationBox.coordinator)
        router.present(creationBox.controllerForPresent)
        creationBox.coordinator.start()
    }
}