//
//  NavigationPresenter.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class NavigationPresenter: Presenter {
    
    typealias T = UINavigationController
    var navigationController: T?
    
    init(navigationController: T) {
        self.navigationController = navigationController
    }
    
    func present(controller: UIViewController, animated: Bool = true) {
        navigationController?.presentViewController(controller, animated: animated, completion: nil)
    }
    
    func push(controller: UIViewController, animated: Bool = true)  {
        navigationController?.pushViewController(controller, animated: animated)
    }
    
    func popController(animated: Bool = true)  {
        navigationController?.popViewControllerAnimated(animated)
    }
    
    func dismissController(animated: Bool = true) {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}