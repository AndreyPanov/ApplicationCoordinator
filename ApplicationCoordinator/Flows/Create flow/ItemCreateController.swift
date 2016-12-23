//
//  CreateController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class ItemCreateController: UIViewController, ItemCreateView {

    //controller handler
    var onHideButtonTap: (() -> ())?
    var onCompleteCreateItem: ((ItemList) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Create"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(ItemCreateController.hideButtonClicked(_:)))
    }
    
    @IBAction func hideButtonClicked(_ sender: UIBarButtonItem) {
        onHideButtonTap?()
    }
    
    @IBAction func createButtonClicked(_ sender: UIBarButtonItem) {
        onCompleteCreateItem?(ItemList(title: "", subtitle: ""))
    }
}
