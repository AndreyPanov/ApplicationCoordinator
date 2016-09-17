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
    
    func createLoginOutput() -> LoginFlowOutput {
        return LoginController.controllerFromStoryboard(.Auth)
    }
    
    func createSignUpHandler() -> SignUpFlowInput & SignUpFlowOutput {
        return SignUpController.controllerFromStoryboard(.Auth)
    }
    
    func createTermsOutput() -> TermsOutput {
        return TermsController.controllerFromStoryboard(.Auth)
    }
    
    func createItemsOutput() -> ItemsListFlowOutput {
        return ItemsListController.controllerFromStoryboard(.Items)
    }
    
    func createItemDetailOutput(item: ItemList) -> ItemDetailFlowOutput {
        
        let controller = ItemDetailController.controllerFromStoryboard(.Items)
        controller.itemList = item
        return controller
    }
    
    func createItemAddOutput() -> ItemCreateFlowOutput {
        return ItemCreateController.controllerFromStoryboard(.Create)
    }
    
    func createSettingsOutput() -> SettingsFlowOutput {
        return SettingsController.controllerFromStoryboard(.Settings)
    }
}
