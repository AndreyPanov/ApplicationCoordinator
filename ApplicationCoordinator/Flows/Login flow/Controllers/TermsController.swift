//
//  TermsController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 25/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class TermsController: UIViewController, TermsView {
    
    var confirmed = false

    @IBAction func termsSwitchValueChanged(_ sender: UISwitch) {
        confirmed = sender.isOn
    }
}
