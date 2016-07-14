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
    
    private weak var signUpInput: SignUpFlowInput?
    
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
        
        let signUp = factory.createSignUpHandler()
        signUpInput = signUp
        signUp.onSignUpComplete = { [weak self] in
            self?.finishFlow?()
        }
        signUp.onTermsButtonTap = { [weak self] in
            self?.showTerms()
        }
        router.push(signUp.toPresent())
    }
    
    private func showTerms() {
        
        let termsOutput = factory.createTermsOutput()
        termsOutput.onPopController = { [weak self] agree in
            self?.signUpInput?.conformTermsAgreement(agree)
        }
        router.push(termsOutput.toPresent())
    }
}