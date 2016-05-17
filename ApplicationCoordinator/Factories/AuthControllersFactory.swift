//
//  AuthControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class AuthControllersFactory {
    
    func createLoginBox() -> (controller: UIViewController, output: LoginFlowOutput) {
        let controller = LoginController.controllerFromStoryboard(.Auth)
        return (controller, controller)
    }
    
    func createSignUpBox() -> (controller: UIViewController, output: SignUpFlowOutput) {
        return SignUpController.controllerFromStoryboard(.Auth)
    }
}