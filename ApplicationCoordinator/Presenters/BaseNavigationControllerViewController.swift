//
//  BaseNavigationControllerViewController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 22/12/2016.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class BaseNavigationControllerViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        
    }

}
