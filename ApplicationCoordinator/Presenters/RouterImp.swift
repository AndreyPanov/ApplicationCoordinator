//
//  NavigationPresenter.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class RouterImp: Router {
    
    fileprivate weak var rootController: UINavigationController?
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    func present(_ controller: UIViewController?) {
        present(controller, animated: true)
    }
    func present(_ controller: UIViewController?, animated: Bool) {
        guard let controller = controller else { return }
        rootController?.present(controller, animated: animated, completion: nil)
    }
    
    func push(_ controller: UIViewController?)  {
        push(controller, animated: true)
    }
    
    func push(_ controller: UIViewController?, animated: Bool)  {
        guard
            let controller = controller
            , (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popController()  {
        popController(animated: true)
    }
    
    func popController(animated: Bool)  {
        let _ = rootController?.popViewController(animated: animated)
    }
    
    func dismissController() {
        dismissController(animated: true, completion: nil)
    }
    
    func dismissController(animated: Bool, completion: (() -> ())?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func setRootController(_ controller: UIViewController?) {
        guard let controller = controller else { return }
        
        rootController?.setViewControllers([controller], animated: false)
    }
    
    func popToRootController(animated: Bool) {
        let _ = rootController?.popToRootViewController(animated: animated)
    }
}
