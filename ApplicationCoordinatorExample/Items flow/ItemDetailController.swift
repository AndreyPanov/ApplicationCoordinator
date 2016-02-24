//
//  ItemDetailController.swift
//  ApplicationCoordinatorExample
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ItemDetailController: UIViewController, Controllerable {
    
    typealias T = ItemAction
    var completionHandler: (ItemAction -> ())? = nil
    var item: String?
    
    @IBOutlet weak var animalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ItemDetailController"
        animalLabel.text = item!
    }
}
