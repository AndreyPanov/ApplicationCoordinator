//
//  LoginController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class LoginController: UIViewController, LoginFlowOutput {

    //controller handler
    var onCompleteAuth: (() -> ())?
    var onSignUpButtonTap: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
    }
    
    @IBAction func loginButtonClicked(_ sender: AnyObject) {
        onCompleteAuth?()
    }
    
    @IBAction func signUpClicked(_ sender: AnyObject) {
        onSignUpButtonTap?()
    }
}
