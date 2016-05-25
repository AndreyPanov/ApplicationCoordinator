//
//  CreateController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class ItemCreateController: UIViewController, ItemCreateFlowOutput {

    //controller handler
    var onHideButtonTap: (() -> ())?
    var onCompleteCreateItem: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Create"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Hide", style: .Plain, target: self, action: #selector(ItemCreateController.hideButtonClicked(_:)))
    }
    
    @IBAction func hideButtonClicked(sender: UIBarButtonItem) {
        onHideButtonTap?()
    }
    
    @IBAction func createButtonClicked(sender: UIBarButtonItem) {
        onCompleteCreateItem?()
    }
}
