//
//  AuthControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 24/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol AuthControllersFactory {
    func createLoginOutput() -> LoginFlowOutput
    func createSignUpHandler() -> SignUpFlowInput & SignUpFlowOutput
    func createTermsOutput() -> TermsOutput
}
