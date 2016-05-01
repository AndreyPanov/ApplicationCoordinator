//
//  Router.swift
//  Services
//
//  Created by Панов Андрей on 02.03.16.
//  Copyright © 2016 Avito. All rights reserved.
//

import UIKit

protocol Router {
    
    weak var presenter:UINavigationController? {get}
    
    func present(controller:UIViewController, animated: Bool)
    func push(controller:UIViewController, animated: Bool)
    func popController(animated: Bool)
    func dismissController(animated: Bool)
}

extension Router {
    
    func present(controller:UIViewController, animated: Bool = true) {
        presenter?.presentViewController(controller, animated: animated, completion: nil)
    }
    
    func push(controller:UIViewController, animated: Bool = true)  {
        presenter?.pushViewController(controller, animated: animated)
    }
    
    func popController(animated: Bool = true)  {
        presenter?.popViewControllerAnimated(animated)
    }
    
    func dismissController(animated: Bool = true) {
        presenter?.dismissViewControllerAnimated(true, completion: nil)
    }
}