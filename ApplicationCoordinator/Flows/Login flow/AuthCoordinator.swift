//
//  LoginCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {

    fileprivate var factory: AuthControllersFactory
    fileprivate var router: Router
    var finishFlow: (()->())?
    
    fileprivate weak var signUpInput: SignUpFlowInput?
    
    init(router: Router,
         factory: AuthControllersFactory) {
        
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showLogin()
    }
    
    //MARK: - Run current flow's controllers
    
    fileprivate func showLogin() {
        
        let loginOutput = factory.createLoginOutput()
        loginOutput.onCompleteAuth = { [weak self] in
            self?.finishFlow?()
        }
        loginOutput.onSignUpButtonTap = { [weak self] in
            self?.showSignUp()
        }
        router.setRootModule(loginOutput)
    }
    
    fileprivate func showSignUp() {
        
        let signUp = factory.createSignUpHandler()
        signUpInput = signUp
        signUp.onSignUpComplete = { [weak self] in
            self?.finishFlow?()
        }
        signUp.onTermsButtonTap = { [weak self] in
            self?.showTerms()
        }
        router.push(signUp)
    }
    
    fileprivate func showTerms() {
        
        let termsOutput = factory.createTermsOutput()
        termsOutput.onPopController = { [weak self] agree in
            self?.signUpInput?.conformTermsAgreement(agree)
        }
        router.push(termsOutput)
    }
}
