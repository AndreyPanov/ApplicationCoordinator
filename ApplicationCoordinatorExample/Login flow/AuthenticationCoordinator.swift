//
//  AuthenticationCoordinator.swift
//  ApplicationCoordinatorExample
//
//  Created by Andrey Panov on 22.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

enum AuthenticationAction {
    case OpenSignUp
    case AuthSuccess
}

class AuthenticationCoordinator: NSObject, Coordinatable {

    private(set) var rootController: UINavigationController
    var completionHandler:CompletionBlock?
    
    required init(rootController: UINavigationController) {
        
        self.rootController = rootController
        super.init()
    }
    
    func start() {
        
        let loginController = LoginController.controllerFromStoryboard(.Auth)
        loginController.completionHandler = { [unowned self] action in
            switch action {
            case .OpenSignUp:
                self.pushSignUp()
            case .AuthSuccess:
                self.authSuccess()
            }
        }
        rootController.setViewControllers([loginController], animated: false)
    }
}

private extension AuthenticationCoordinator {
    
    func pushSignUp() {
        
        let signUpController = SignUpController.controllerFromStoryboard(.Auth)
        signUpController.completionHandler = { [unowned self] action in
            switch action {
            case .AuthSuccess:
                self.authSuccess()
            default:
                print("some")
            }
        }
        rootController.pushViewController(signUpController, animated: true)
    }
    
    func authSuccess() {
        
        if let handler = completionHandler {
            handler()
        }
    }
}