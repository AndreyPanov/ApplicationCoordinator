//
//  Router.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 19/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

protocol Router: class {
    
    weak var rootController: UINavigationController? { get }
    
    func present(controller: UIViewController?)
    func present(controller: UIViewController?, animated: Bool)
    
    func push(controller: UIViewController?)
    func push(controller: UIViewController?, animated: Bool)
    
    func popController()
    func popController(animated: Bool)
    
    func dismissController()
    func dismissController(animated: Bool)
    
    func setRootController(controller: UIViewController?)
    func popToRootController(animated: Bool)
}