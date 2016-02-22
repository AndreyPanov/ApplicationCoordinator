//
//  LoginController.swift
//  ApplicationCoordinatorExample
//
//  Created by Панов Андрей on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    var complitionHandler: Optional<AuthenticationAction -> ()> = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "LoginController"
    }
    
    @IBAction func openSignUp() {
        
        if let handler = complitionHandler {
            handler(.OpenSignUp)
        }
    }
    
    @IBAction func authComplete() {
        
        //check smth
        //and open items
        if let handler = complitionHandler {
            handler(.AuthSuccess)
        }
    }
}
