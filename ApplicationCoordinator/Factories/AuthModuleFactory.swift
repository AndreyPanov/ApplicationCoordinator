//
//  AuthControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 24/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol AuthModuleFactory {
    func makeLoginOutput() -> LoginView
    func makeSignUpHandler() -> SignUpView
    func makeTermsOutput() -> TermsView
}
