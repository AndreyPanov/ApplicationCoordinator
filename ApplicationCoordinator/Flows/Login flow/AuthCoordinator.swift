//
//  LoginCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {

    var factory: AuthControllersFactory
    var router: Router
    var finishFlow: (()->())?
    
    init(router: Router,
         factory: AuthControllersFactory) {
        
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showLogin()
    }
    
    //MARK: - Run current flow's controllers
    
    private func showLogin() {
        
        let loginBox = factory.createLoginBox()
        loginBox.output.onCompleteAuth = { [weak self] in
            self?.finishFlow?()
        }
        loginBox.output.onSignUpButtonTap = { [weak self] in
            self?.showSignUp()
        }
        loginBox.output.onTermsButtonTap = { [weak self] completionHandler in
            self?.showTerms(completionHandler)
        }
        router.push(loginBox.controllerForPresent, animated: false)
    }
    
    private func showSignUp() {
        
        let signUpBox = factory.createSignUpBox()
        signUpBox.output.onSignUpComplete = { [weak self] in
            self?.finishFlow?()
        }
        router.push(signUpBox.controllerForPresent)
    }
    
    private func showTerms(completionHandler: ((Bool) -> ())) {
        
        let termsBox = factory.createTermsBox()
        termsBox.output.onPopController = completionHandler
        router.push(termsBox.controller)
    }
}