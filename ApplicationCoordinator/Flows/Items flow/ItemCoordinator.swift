//
//  ItemCoordinator.swift
//  Services
//
//  Created by Andrey Panov on 19.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//

final class ItemCoordinator: BaseCoordinator {

    private let factory: ItemControllersFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
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
      
        let itemsOutput = factory.makeItemsOutput()
        itemsOutput.authNeed = { [weak self] in
            self?.runAuthCoordinator()
        }
        itemsOutput.onItemSelect = { [weak self] (item) in
            self?.showItemDetail(item)
        }
        itemsOutput.onCreateButtonTap = { [weak self] in
            self?.runCreationCoordinator()
        }
        router.setRootModule(itemsOutput)
    }
    
    private func showItemDetail(_ item: ItemList) {
        
        let itemDetailFlowOutput = factory.makeItemDetailOutput(item: item)
        router.push(itemDetailFlowOutput)
    }
    
//MARK: - Run coordinators (switch to another flow)
    
    private func runAuthCoordinator() {
        let (coordinator, module) = coordinatorFactory.makeAuthCoordinatorBox()
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.router.dismissModule()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        router.present(module, animated: false)
        coordinator.start()
    }
    
    private func runCreationCoordinator() {
        
        let (coordinator, module) = coordinatorFactory.makeItemCreationCoordinatorBox()
        coordinator.finishFlow = { [weak self, weak coordinator] item in
            
            self?.router.dismissModule()
            self?.removeDependency(coordinator)
            if let item = item {
                self?.showItemDetail(item)
            }
        }
        addDependency(coordinator)
        router.present(module)
        coordinator.start()
    }
}
