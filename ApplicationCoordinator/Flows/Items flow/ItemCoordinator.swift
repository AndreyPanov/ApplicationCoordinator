//
//  ItemCoordinator.swift
//  Services
//
//  Created by Панов Андрей on 19.04.16.
//  Copyright © 2016 Avito. All rights reserved.
//
import UIKit

enum ItemListActions {
    //case ItemSelect(ItemList)
    case New
    //case VasSelect(ItemDetail)
    //case Edit(ItemDetail)
    case VasApply
}

class ItemCoordinator: NSObject, Coordinatable {

    var flowCompletionHandler:CoordinatorHandler?
    var factory: ItemFactory
    var coordinatorFactory: CoordinatorFactory
    private(set) weak var presenter: UINavigationController?
    //private var creationCoordinator: ItemCreationCoordinator?
    //private var editCoordinator: ItemEditCoordinator?
    
    init(presenter: UINavigationController) {
        
        self.presenter = presenter
        factory = ItemFactory()
        coordinatorFactory = CoordinatorFactory()
    }
    
    func start() {
        //showItemList()
    }
    /*
    func showItemList() {
        
        let itemListController = factory.createItemListController()
        itemListController.completionHandler = { [weak self] result in
            
            if case let ItemListActions.ItemSelect(list) = result {
                self?.showItemDetail(list)
            }
            else if case ItemListActions.New = result {
                self?.runCreationCoordinator()
            }
        }
        push(itemListController, animated: false)
    }
    
    func showItemDetail(item: ItemList) {
        
        let itemDetailController = factory.createItemDetailController()
        itemDetailController.item = item
        itemDetailController.completionHandler = { [weak self] result in
            
            if case let ItemListActions.VasSelect(detail) = result, let itemId = detail.item?.id {
                self?.showVasList(itemId)
            }
            else if case let ItemListActions.Edit(detail) = result {
                self?.runEditCoordinator(detail)
            }
        }
        push(itemDetailController)
    }
    
    func showVasList(itemId: Int) {
        
        let vasPublicationController = factory.createVasController()
        vasPublicationController.itemId = itemId
        vasPublicationController.isEditingState = true
        vasPublicationController.completionHandler = { [weak self] result in
            if case ItemCreationActions.Success(_) = result {
                
                NSNotificationCenter.defaultCenter().postNotificationName(NotificationsNames.kItemDidUpdateNotification, object: nil)
                self?.pop()
            }
        }
        push(vasPublicationController)
    }
    
    func runEditCoordinator(item: ItemDetail) {
        
        if let presenter = presenter {
            
            let creationFlow = coordinatorFactory.createEditCoordinator()
            editCoordinator = creationFlow.editCoordinator
            editCoordinator?.item = item.item
            editCoordinator?.flowCompletionHandler = { [unowned self] in
                
                presenter.dismissViewControllerAnimated(true, completion: nil)
                self.editCoordinator = nil
            }
            editCoordinator?.start()
            presenter.presentViewController(creationFlow.presenter, animated: true, completion: nil)
        }
    }
    
    func runCreationCoordinator() {
        
        if let presenter = presenter {
            
            let creationFlow = coordinatorFactory.createItemCreationCoordinator()
            creationCoordinator = creationFlow.creationCoordinator
            creationCoordinator?.flowCompletionHandler = { [unowned self] in
                
                presenter.dismissViewControllerAnimated(true, completion: nil)
                self.creationCoordinator = nil
            }
            creationCoordinator?.start()
            presenter.presentViewController(creationFlow.presenter, animated: true, completion: nil)
        }
    }*/
}

class ItemFactory {
    /*
    func createItemListController() -> ItemsListAdsController {
        return ItemsListAdsController.controllerFromStoryboard(.Tab)
    }
    
    func createItemDetailController() -> ItemDetailsController {
        return ItemDetailsController.controllerFromStoryboard(.Items)
    }
    
    func createVasController() -> VasPublicationController {
        return VasPublicationController.controllerFromStoryboard(.Items)
    }*/
}

