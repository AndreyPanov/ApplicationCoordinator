//
//  Presentable.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23.06.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}
