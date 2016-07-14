//
//  NavigationPresenter.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class RouterImp: Router {
    
    private(set) weak var rootController: UINavigationController?
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    func present(controller: UIViewController?) {
        present(controller, animated: true)
    }
    func present(controller: UIViewController?, animated: Bool) {
        guard let controller = controller else { return }
        rootController?.presentViewController(controller, animated: animated, completion: nil)
    }
    
    func push(controller: UIViewController?)  {
        push(controller, animated: true)
    }
    
    func push(controller: UIViewController?, animated: Bool)  {
        guard
            let controller = controller
            where (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popController()  {
        popController(true)
    }
    
    func popController(animated: Bool)  {
        rootController?.popViewControllerAnimated(animated)
    }
    
    func dismissController() {
        dismissController(true)
    }
    
    func dismissController(animated: Bool) {
        rootController?.dismissViewControllerAnimated(animated, completion: nil)
    }
}