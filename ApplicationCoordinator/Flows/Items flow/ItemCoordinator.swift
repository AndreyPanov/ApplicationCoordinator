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
        let (coordinator, controller) = coordinatorFactory.createAuthCoordinatorBox()
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.router.dismissController()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        router.present(controller, animated: false)
        coordinator.start()
    }
    
    private func runCreationCoordinator() {
        
        let (coordinator, controller) = coordinatorFactory.createItemCreationCoordinatorBox()
        coordinator.finishFlow = { [weak self, weak coordinator] item in
            
            self?.router.dismissController()
            self?.removeDependency(coordinator)
            if let item = item {
                self?.showItemDetail(item)
            }
        }
        addDependency(coordinator)
        router.present(controller)
        coordinator.start()
    }
}