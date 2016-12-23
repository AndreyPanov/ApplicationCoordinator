//
//  AuthControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

final class ControllersFactoryImp:
            AuthControllersFactory,
            ItemControllersFactory,
            ItemCreateControllersFactory,
            SettingsControllersFactory {
    
    func createLoginOutput() -> LoginView {
        return LoginController.controllerFromStoryboard(.Auth)
    }
    
    func createSignUpHandler() -> SignUpView {
        return SignUpController.controllerFromStoryboard(.Auth)
    }
    
    func createTermsOutput() -> TermsView {
        return TermsController.controllerFromStoryboard(.Auth)
    }
    
    func createItemsOutput() -> ItemsListView {
        return ItemsListController.controllerFromStoryboard(.Items)
    }
    
    func createItemDetailOutput(item: ItemList) -> ItemDetailView {
        
        let controller = ItemDetailController.controllerFromStoryboard(.Items)
        controller.itemList = item
        return controller
    }
    
    func createItemAddOutput() -> ItemCreateView {
        return ItemCreateController.controllerFromStoryboard(.Create)
    }
    
    func createSettingsOutput() -> SettingsView {
        return SettingsController.controllerFromStoryboard(.Settings)
    }
}
