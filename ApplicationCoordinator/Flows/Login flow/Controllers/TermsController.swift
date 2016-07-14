//
//  TermsController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 25/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class TermsController: UIViewController, TermsControllerOutput {
    
    var onPopController: (Bool -> ())?
    var confirmed = false
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isMovingFromParentViewController() {
            onPopController?(confirmed)
        }
    }

    @IBAction func termsSwitchValueChanged(sender: UISwitch) {
        confirmed = sender.on
    }
}
