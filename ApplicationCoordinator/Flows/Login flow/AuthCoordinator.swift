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

    var factory: AuthControllersFactory
    var presenter: NavigationPresenter?
    
    init(presenter: NavigationPresenter) {
        
        factory = AuthControllersFactory()
        self.presenter = presenter
    }
    
    override func start() {
        showLogin()
    }
    
    //MARK: - Run current flow's controllers
    
    func showLogin() {
        
        let loginBox = factory.createLoginBox()
        loginBox.output.onHideButtonTap = { [weak self] in
            self?.flowCompletionHandler?()
        }
        loginBox.output.onCompleteCreateItem = { [weak self] in
            self?.flowCompletionHandler?()
        }
        loginBox.output.onSignUpButtonTap = { [weak self] in
            self?.showSignUp()
        }
        presenter?.push(loginBox.controller, animated: false)
    }
    
    func showSignUp() {
        
        let signUpBox = factory.createSignUpBox()
        signUpBox.output.onSignUpComplete = { [weak self] in
            self?.flowCompletionHandler?()
        }
        presenter?.push(signUpBox.controller)
    }
}