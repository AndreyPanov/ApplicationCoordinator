//
//  TermsController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 25/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class TermsController: UIViewController, TermsView {
    
    @IBOutlet weak var termsSwitch: UISwitch! {
        
        didSet {
            termsSwitch.isOn = confirmed
        }
    }

    var confirmed = false
    var onConfirmChanged: ((Bool) -> ())?

    @IBAction func termsSwitchValueChanged(_ sender: UISwitch) {
        onConfirmChanged?(sender.isOn)
    }
}
