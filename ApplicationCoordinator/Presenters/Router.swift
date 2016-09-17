//
//  Router.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 19/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

protocol Router: class {
    
    func present(_ controller: UIViewController?)
    func present(_ controller: UIViewController?, animated: Bool)
    
    func push(_ controller: UIViewController?)
    func push(_ controller: UIViewController?, animated: Bool)
    
    func popController()
    func popController(animated: Bool)
    
    func dismissController()
    func dismissController(animated: Bool, completion: (() -> ())?)
    
    func setRootController(_ controller: UIViewController?)
    func popToRootController(animated: Bool)
}
