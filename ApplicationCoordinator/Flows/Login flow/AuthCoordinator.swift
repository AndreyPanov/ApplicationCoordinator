//
//  LoginCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class AuthCoordinator: NSObject, Coordinatable {

    var flowCompletionHandler:CoordinatorHandler?
    var factory: AuthFactory
    var coordinatorFactory: CoordinatorFactory
    private(set) weak var presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        
        self.presenter = presenter
        factory = AuthFactory()
        coordinatorFactory = CoordinatorFactory()
    }
    
    func start() {
    }
    
    //MARK: - Run current flow's controllers
    
    func showLogin() {
        
        let loginController = factory.createLoginController()
        loginController.completionHandler = { [weak self] result in
            
            if case let ItemListActions.ItemSelect(list) = result {
                self?.showItemDetail(list)
            }
            else if case ItemListActions.Create = result {
                self?.runCreationCoordinator()
            }
        }
        push(loginController, animated: false)
    }
}

class AuthFactory {
    
    func createLoginController() -> LoginController {
        return LoginController.controllerFromStoryboard(.Auth)
    }
}