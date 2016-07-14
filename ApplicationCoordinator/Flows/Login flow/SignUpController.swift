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
            termsLabel.hidden = !confirmed
            signUpButton.enabled = confirmed
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SignUp"
        termsLabel.hidden = true
        signUpButton.enabled = false
    }
    
    @IBAction func signUpClicked(sender: AnyObject) {
        if confirmed {
            onSignUpComplete?()
        }
    }
    
    @IBAction func termsButtonClicked(sender: AnyObject) {
        onTermsButtonTap?()
    }
    
    func conformTermsAgreement(agree: Bool) {
        confirmed = agree
    }
}
