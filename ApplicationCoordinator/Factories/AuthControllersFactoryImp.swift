//
//  AuthControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class AuthControllersFactoryImp: AuthControllersFactory {
    
    func createLoginBox() ->
        (controllerForPresent: UIViewController,
        output: LoginFlowOutput) {
            
            let controller = LoginController.controllerFromStoryboard(.Auth)
            return (controller, controller)
    }
    
    func createSignUpBox() ->
        (controllerForPresent: UIViewController,
        output: SignUpFlowOutput) {
            
            let controller = SignUpController.controllerFromStoryboard(.Auth)
            return (controller, controller)
    }
    
    func createTermsBox() ->
        (controller: UIViewController,
        output: TermsControllerOutput) {
            
            let controller = TermsController.controllerFromStoryboard(.Auth)
            return (controller, controller)
    }
}