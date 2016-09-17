//
//  SignUpController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class SignUpController: UIViewController, SignUpFlowInput, SignUpFlowOutput {
    
    //controller handler
    var onSignUpComplete: (() -> ())?
    var onTermsButtonTap: (() -> ())?

    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    var confirmed = false {
        didSet {
            termsLabel.isHidden = !confirmed
            signUpButton.isEnabled = confirmed
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SignUp"
        termsLabel.isHidden = true
        signUpButton.isEnabled = false
    }
    
    @IBAction func signUpClicked(_ sender: AnyObject) {
        if confirmed {
            onSignUpComplete?()
        }
    }
    
    @IBAction func termsButtonClicked(_ sender: AnyObject) {
        onTermsButtonTap?()
    }
    
    func conformTermsAgreement(_ agree: Bool) {
        confirmed = agree
    }
}
