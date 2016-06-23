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
        
        let loginOutput = factory.createLoginOutput()
        loginOutput.onCompleteAuth = { [weak self] in
            self?.finishFlow?()
        }
        loginOutput.onSignUpButtonTap = { [weak self] in
            self?.showSignUp()
        }
        router.push(loginOutput.toPresent(), animated: false)
    }
    
    private func showSignUp() {
        
        let signUpOutput = factory.createSignUpOutput()
        signUpOutput.onSignUpComplete = { [weak self] in
            self?.finishFlow?()
        }
        signUpOutput.onTermsButtonTap = { [weak self] completionHandler in
            self?.showTerms(completionHandler)
        }
        router.push(signUpOutput.toPresent())
    }
    
    private func showTerms(completionHandler: ((Bool) -> ())) {
        
        let termsOutput = factory.createTermsOutput()
        termsOutput.onPopController = completionHandler
        router.push(termsOutput.toPresent())
    }
}