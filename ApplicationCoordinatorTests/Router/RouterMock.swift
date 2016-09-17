//
//  RouterMock.swift
//  ApplicationCoordinator
//
//  Created by Андрей on 02.09.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit
@testable import ApplicationCoordinator

protocol RouterMock: Router {
    var navigationStack: [UIViewController] {get}
    var presented: UIViewController? {get}
}

final class RouterMockImp: RouterMock {
    
    // in test cases router store the rootController referense
    fileprivate(set) var navigationStack: [UIViewController] = []
    fileprivate(set) var presented: UIViewController?
    
    //all of the actions without animation
    func present(_ controller: UIViewController?) {
        present(controller, animated: false)
    }
    func present(_ controller: UIViewController?, animated: Bool) {
        guard let controller = controller else { return }
        presented = controller
    }
    
    func push(_ controller: UIViewController?)  {
        push(controller, animated: false)
    }
    
    func push(_ controller: UIViewController?, animated: Bool)  {
        guard
            let controller = controller,
            (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        
        navigationStack.append(controller)
    }
    
    func popController()  {
        popController(animated: false)
    }
    
    func popController(animated: Bool)  {
        navigationStack.removeLast()
    }
    
    func dismissController() {
        dismissController(animated: false, completion: nil)
    }
    
    func dismissController(animated: Bool, completion: (() -> ())?) {
        presented = nil
    }
    
    func setRootController(_ controller: UIViewController?) {
        guard let controller = controller else { return }
        navigationStack.append(controller)
    }
    
    func popToRootController(animated: Bool) {
        guard let first = navigationStack.first else { return }
        navigationStack = [first]
    }
}
