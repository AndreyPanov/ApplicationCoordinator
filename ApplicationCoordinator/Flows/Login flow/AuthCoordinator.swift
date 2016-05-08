//
//  LoginCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

enum AuthActions {
    case SignUp, Complete, Hide
}

class AuthCoordinator: BaseCoordinator {

    var factory: AuthFactory
    var presenter: NavigationPresenter?
    
    init(presenter: NavigationPresenter) {
        
        factory = AuthFactory()
        self.presenter = presenter
    }
    
    override func start() {
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
                self?.flowCompletionHandler?()
            }
            else if case AuthActions.Hide = result {
                //finish flow
                self?.flowCompletionHandler?()
            }
        }
        presenter?.push(loginController, animated: false)
    }
    
    func showSignUp() {
        
        let signUpController = factory.createSignUpController()
        signUpController.completionHandler = { [weak self] result in
            
            if case AuthActions.Complete = result {
                //finish flow
                self?.flowCompletionHandler?()
            }
        }
        presenter?.push(signUpController)
    }
}

//MARK: - Factory

class AuthFactory {
    
    func createLoginController() -> LoginController {
        return LoginController.controllerFromStoryboard(.Auth)
    }
    
    func createSignUpController() -> SignUpController {
        return SignUpController.controllerFromStoryboard(.Auth)
    }
}