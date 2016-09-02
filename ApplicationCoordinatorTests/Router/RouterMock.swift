//
//  RouterMock.swift
//  ApplicationCoordinator
//
//  Created by Андрей on 02.09.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit
@testable import ApplicationCoordinator

class RouterMock: Router {
    
    // in test cases router store the rootController referense
    private(set) var rootController: UINavigationController?
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    //all of the actions without animation
    func present(controller: UIViewController?) {
        present(controller, animated: false)
    }
    func present(controller: UIViewController?, animated: Bool) {
        guard let controller = controller else { return }
        rootController?.presentViewController(controller, animated: false, completion: nil)
    }
    
    func push(controller: UIViewController?)  {
        push(controller, animated: false)
    }
    
    func push(controller: UIViewController?, animated: Bool)  {
        guard
            let controller = controller
            where (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        
        rootController?.pushViewController(controller, animated: false)
    }
    
    func popController()  {
        popController(false)
    }
    
    func popController(animated: Bool)  {
        rootController?.popViewControllerAnimated(false)
    }
    
    func dismissController() {
        dismissController(false)
    }
    
    func dismissController(animated: Bool) {
        rootController?.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func setRootController(controller: UIViewController?) {
        guard let controller = controller else { return }
        
        rootController?.setViewControllers([controller], animated: false)
    }
    
    func popToRootController(animated: Bool) {
        rootController?.popToRootViewControllerAnimated(false)
    }
}
