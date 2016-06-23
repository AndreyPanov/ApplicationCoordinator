//
//  ItemCreateControllersFactory.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 24/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

protocol ItemCreateControllersFactory {
    func createItemAddOutput() -> ItemCreateFlowOutput
}