//
//  LoginController.swift
//  ApplicationCoordinatorExample
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class LoginController: UIViewController, Controllerable {
    
    typealias T = AuthenticationAction
    var completionHandler: Optional<AuthenticationAction -> ()> = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "LoginController"
    }
    
    @IBAction func openSignUp() {
        
        if let handler = completionHandler {
            handler(.OpenSignUp)
        }
    }
    
    @IBAction func authComplete() {
        
        //check smth
        //and open items
        if let handler = completionHandler {
            handler(.AuthSuccess)
        }
    }
}
