//
//  ItemDetailController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class ItemDetailController: UIViewController, ItemDetailView {

    //controller handler
    var itemList: ItemList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = itemList?.title ?? "Detail"
    }
}
