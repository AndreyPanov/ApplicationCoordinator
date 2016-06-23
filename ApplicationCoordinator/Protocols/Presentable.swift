//
//  Presentable.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 23.06.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController
}

extension Presentable where Self: UIViewController {
    
    func toPresent() -> UIViewController {
        return self
    }
}