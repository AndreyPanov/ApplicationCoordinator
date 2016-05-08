//
//  AuthControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

class AuthControllersFactory {
    
    func createLoginController() -> LoginController {
        return LoginController.controllerFromStoryboard(.Auth)
    }
    
    func createSignUpController() -> SignUpController {
        return SignUpController.controllerFromStoryboard(.Auth)
    }
}