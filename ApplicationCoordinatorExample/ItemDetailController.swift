//
//  ItemDetailController.swift
//  ApplicationCoordinatorExample
//
//  Created by Панов Андрей on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ItemDetailController: UIViewController {
    
    var item: String?
    @IBOutlet weak var animalLabel: UILabel!
    
    var complitionHandler: Optional<ItemAction -> ()> = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ItemDetailController"
        animalLabel.text = item!
    }
}
