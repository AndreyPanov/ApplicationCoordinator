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
    
    func present(controller: UIViewController?, animated: Bool)
    func push(controller: UIViewController?, animated: Bool)
    func popController(animated: Bool)
    func dismissController(animated: Bool)
}

extension Router {
    
    func present(controller: UIViewController?, animated: Bool = true) {
        guard let controller = controller else { return }
        rootController?.presentViewController(controller, animated: animated, completion: nil)
    }
    
    func push(controller: UIViewController?, animated: Bool = true)  {
        guard let controller = controller else { return }
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popController(animated: Bool = true)  {
        rootController?.popViewControllerAnimated(animated)
    }
    
    func dismissController(animated: Bool = true) {
        rootController?.dismissViewControllerAnimated(animated, completion: nil)
    }
}