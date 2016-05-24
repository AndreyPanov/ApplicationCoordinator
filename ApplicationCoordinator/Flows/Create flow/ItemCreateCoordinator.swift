//
//  CreateCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

final class ItemCreateCoordinator: BaseCoordinator, ItemCreateCoordinatorOutput {

    var factory: ItemCreateControllersFactory
    var router: Router
    var finishFlow: (()->())?
    
    init(router: Router,
        factory: ItemCreateControllersFactory) {
        
        self.factory = ItemCreateControllersFactoryImp()
        self.router = router
    }
    
    override func start() {
        showCreate()
    }
    
//MARK: - Run current flow's controllers
    
    private func showCreate() {
        
        let createItemFlow = factory.createItemAddBox()
        createItemFlow.output.onCompleteCreateItem = { [weak self] in
            self?.finishFlow?()
        }
        createItemFlow.output.onHideButtonTap = { [weak self] in
            self?.finishFlow?()
        }
        router.push(createItemFlow.controllerForPresent, animated: false)
    }
}