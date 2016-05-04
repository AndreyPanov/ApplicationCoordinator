//
//  FlowController.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import Foundation

protocol FlowController: NSObjectProtocol {
    
    associatedtype T //enum Actions type
    var completionHandler: (T -> ())? {get set}
}