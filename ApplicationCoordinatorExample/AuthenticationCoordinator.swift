//
//  AuthenticationCoordinator.swift
//  ApplicationCoordinatorExample
//
//  Created by Панов Андрей on 22.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

enum AuthenticationAction {
    case OpenSignUp
    case AuthSuccess
}

class AuthenticationCoordinator: NSObject, Coordinatable {

    private(set) var rootController: UINavigationController
    private(set) lazy var childCoorditators: [Coordinatable] = []
    var complitionHandler:ComplitionBlock?
    
    required init(rootController: UINavigationController) {
        
        self.rootController = rootController
        super.init()
    }
    
    func start() {
        
        let loginController = LoginController.controllerFromStoryboard(.Auth)
        loginController.complitionHandler = { action in
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
        signUpController.complitionHandler = { action in
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
        
        if let handler = complitionHandler {
            handler()
        }
    }
}