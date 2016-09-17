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
    fileprivate(set) var rootController: UINavigationController?
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    //all of the actions without animation
    func present(_ controller: UIViewController?) {
        present(controller, animated: false)
    }
    func present(_ controller: UIViewController?, animated: Bool) {
        guard let controller = controller else { return }
        rootController?.present(controller, animated: false, completion: nil)
    }
    
    func push(_ controller: UIViewController?)  {
        push(controller, animated: false)
    }
    
    func push(_ controller: UIViewController?, animated: Bool)  {
        guard
            let controller = controller
            , (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        
        rootController?.pushViewController(controller, animated: false)
    }
    
    func popController()  {
        popController(false)
    }
    
    func popController(_ animated: Bool)  {
        let _ = rootController?.popViewController(animated: false)
    }
    
    func dismissController() {
        dismissController(false, completion: nil)
    }
    
    func dismissController(_ animated: Bool, completion: (() -> ())?) {
        rootController?.dismiss(animated: false, completion: completion)
    }
    
    func setRootController(_ controller: UIViewController?) {
        guard let controller = controller else { return }
        
        rootController?.setViewControllers([controller], animated: false)
    }
    
    func popToRootController(_ animated: Bool) {
        let _ = rootController?.popToRootViewController(animated: false)
    }
}
