//
//  NavigationPresenter.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class NavigationPresenter: Presenter {
    
    typealias ViewController = UINavigationController
    var rootController: ViewController?
    
    init(rootController: ViewController) {
        self.rootController = rootController
    }
    
    func present(controller: UIViewController, animated: Bool = true) {
        rootController?.presentViewController(controller, animated: animated, completion: nil)
    }
    
    func push(controller: UIViewController, animated: Bool = true)  {
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popController(animated: Bool = true)  {
        rootController?.popViewControllerAnimated(animated)
    }
    
    func dismissController(animated: Bool = true) {
        rootController?.dismissViewControllerAnimated(true, completion: nil)
    }
}