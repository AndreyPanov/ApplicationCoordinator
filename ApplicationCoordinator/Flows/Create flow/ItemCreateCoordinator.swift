//
//  CreateCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

class ItemCreateCoordinator: BaseCoordinator {

    var factory: ItemCreateControllersFactory
    var presenter: NavigationPresenter?
    
    init(presenter: NavigationPresenter) {
        
        factory = ItemCreateControllersFactory()
        self.presenter = presenter
    }
    
    override func start() {
        showCreate()
    }
    
//MARK: - Run current flow's controllers
    
    func showCreate() {
        
        let createItemFlow = factory.createItemAddBox()
        createItemFlow.output.onCompleteCreateItem = { [weak self] in
            self?.presenter?.dismissController()
        }
        createItemFlow.output.onHideButtonTap = { [weak self] in
            self?.presenter?.dismissController()
        }
        presenter?.push(createItemFlow.controller, animated: false)
    }
}