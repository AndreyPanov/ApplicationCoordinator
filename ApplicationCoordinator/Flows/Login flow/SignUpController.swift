//
//  SignUpController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class SignUpController: UIViewController, SignUpFlowOutput {
    
    //controller handler
    var onSignUpComplete: (() -> ())?
    var onTermsButtonTap: (((Bool)->()) -> ())?

    @IBOutlet weak var termsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SignUp"
        termsLabel.hidden = true
    }
    
    @IBAction func signUpClicked(sender: AnyObject) {
        onSignUpComplete?()
    }
    
    @IBAction func termsButtonClicked(sender: AnyObject) {
        onTermsButtonTap?() { [weak self] confirmed in
            self?.termsLabel.hidden = !confirmed
        }
    }
}
