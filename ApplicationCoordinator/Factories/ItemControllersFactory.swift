//
//  ItemControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 24/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

protocol ItemControllersFactory {
    func createItemsOutput() -> ItemsListFlowOutput
    func createItemDetailOutput(item item: ItemList) -> ItemDetailFlowOutput
}