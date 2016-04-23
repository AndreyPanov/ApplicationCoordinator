//
//  ItemCoordinator.swift
//  Services
//
//  Created by Панов Андрей on 19.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

enum ItemListActions {
    case ItemSelect(ItemList)
    case Create
}

class ItemCoordinator: NSObject, Coordinatable {

    var flowCompletionHandler:CoordinatorHandler?
    var factory: ItemFactory
    var coordinatorFactory: CoordinatorFactory
    private(set) weak var presenter: UINavigationController?
    private var creationCoordinator: ItemCreateCoordinator?
    //private var editCoordinator: ItemEditCoordinator?
    
    init(presenter: UINavigationController) {
        
        self.presenter = presenter
        factory = ItemFactory()
        coordinatorFactory = CoordinatorFactory()
    }
    
    func start() {
        
        // Just example
        // In real project we would be call some AuthManager and check user valid session.
        let isUserAuth = false
        
        if isUserAuth {
            showItemList()
        } else {
            runAuthCoodrinator()
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
        push(itemListController, animated: false)
    }
    
    
    
    func showItemDetail(item: ItemList) {
        
        let itemDetailController = factory.createItemDetailController()
        itemDetailController.item = item
        itemDetailController.completionHandler = { result in
            /* continue the flow */
        }
        push(itemDetailController)
    }
    
//MARK: - Run coordinators (switch to another flow)
    
    func runAuthCoodrinator() {
        
        if let presenter = presenter {
            
            let creationFlow = coordinatorFactory.createItemCreationCoordinator()
            creationCoordinator = creationFlow.createCoordinator
            creationCoordinator?.flowCompletionHandler = { [unowned self] in
                
                presenter.dismissViewControllerAnimated(true, completion: nil)
                self.creationCoordinator = nil
            }
            creationCoordinator?.start()
            presenter.presentViewController(creationFlow.presenter, animated: true, completion: nil)
        }
    }
    
    func runCreationCoordinator() {
        
        if let presenter = presenter {
            
            let creationFlow = coordinatorFactory.createItemCreationCoordinator()
            creationCoordinator = creationFlow.createCoordinator
            creationCoordinator?.flowCompletionHandler = { [unowned self] in
                
                presenter.dismissViewControllerAnimated(true, completion: nil)
                self.creationCoordinator = nil
            }
            creationCoordinator?.start()
            presenter.presentViewController(creationFlow.presenter, animated: true, completion: nil)
        }
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

