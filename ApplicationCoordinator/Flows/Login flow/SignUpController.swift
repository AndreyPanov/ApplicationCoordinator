//
//  SignUpController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class SignUpController: UIViewController, SignUpFlowOutput {
    
    //controller handler
    var onSignUpComplete: (() -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SignUp"
    }
    
    @IBAction func signUpClicked(sender: AnyObject) {
        onSignUpComplete?()
    }
}
