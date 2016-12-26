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
    
    func toPresent() -> UIViewController? {
        return nil
    }
    
    //all of the actions without animation
    func present(_ module: Presentable?) {
        present(module, animated: false)
    }
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        presented = controller
    }
    
    func push(_ module: Presentable?)  {
        push(module, animated: false)
    }
    
    func push(_ module: Presentable?, animated: Bool)  {
        guard
            let controller = module?.toPresent(),
            (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        
        navigationStack.append(controller)
    }
    func push(_ module: Presentable?, animated: Bool, completion: (()->())?) {}
    
    func popModule()  {
        popModule(animated: false)
    }
    
    func popModule(animated: Bool)  {
        navigationStack.removeLast()
    }
    
    func dismissModule() {
        dismissModule(animated: false, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: (() -> ())?) {
        presented = nil
    }
    
    func setRootModule(_ module: Presentable?) {
        guard let controller = module?.toPresent() else { return }
        navigationStack.append(controller)
    }
    
    func popToRootModule(animated: Bool) {
        guard let first = navigationStack.first else { return }
        navigationStack = [first]
    }
}
