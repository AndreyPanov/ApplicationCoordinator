//
//  LoginCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

enum AuthActions {
    case SignUp
    case Complete
}

class AuthCoordinator: NSObject, Coordinatable {

    var flowCompletionHandler:CoordinatorHandler?
    var factory: AuthFactory
    private(set) weak var presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        
        self.presenter = presenter
        factory = AuthFactory()
    }
    
    func start() {
        showLogin()
    }
    
    //MARK: - Run current flow's controllers
    
    func showLogin() {
        
        let loginController = factory.createLoginController()
        loginController.completionHandler = { [weak self] result in
            
            if case AuthActions.SignUp = result {
                self?.showSignUp()
            }
            else if case AuthActions.Complete = result {
                //finish flow
                self?.flowCompletionHandler
            }
        }
        push(loginController, animated: false)
    }
    
    func showSignUp() {
        
    }
}

//MARK: - Factory

class AuthFactory {
    
    func createLoginController() -> LoginController {
        return LoginController.controllerFromStoryboard(.Auth)
    }
}