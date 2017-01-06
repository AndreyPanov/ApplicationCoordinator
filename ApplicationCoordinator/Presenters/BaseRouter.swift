//
//  BaseRouter.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 26/12/2016.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class BaseRouter: UINavigationController {
    
    // MARK: - Properties -
    var onPush: ((UIViewController) -> Bool)?
    var onPop: (([UIViewController]) -> Bool)?
    
    private var nextCompletion: (() -> Void)?
    
    // MARK: - UINavigationController -
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard onPush?(viewController) ?? true else { return }
        
        super.pushViewController(viewController, animated: animated)
        
        guard animated, let coordinator = transitionCoordinator else {
            
            self.runCompletions()
            return
        }
        
        let transition = alongsideTransitionForPushing(viewController: viewController)
        
        coordinator.animate(alongsideTransition: transition) { [weak self] _ in
            self?.runCompletions()
        }
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        guard onPop?(topViewController.map( { [$0] } ) ?? []) ?? true else { return nil }
        
        let result = super.popViewController(animated: animated)
        
        guard animated, let coordinator = transitionCoordinator else {
            
            self.runCompletions()
            return result
        }
        
        let transition = alongsideTransitionForPopping(viewControllers: result.map( { [$0] } ) ?? [])
        
        coordinator.animate(alongsideTransition: transition) { [weak self] _ in
            self?.runCompletions()
        }
        
        return result
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        guard onPop?(Array(viewControllers.dropFirst())) ?? true else { return nil }
        
        let result = super.popToRootViewController(animated: animated)
        
        guard animated, let coordinator = transitionCoordinator else {
            
            self.runCompletions()
            return result
        }
        
        let transition = alongsideTransitionForPopping(viewControllers: result ?? [])
        
        coordinator.animate(alongsideTransition: transition) { [weak self] _ in
            self?.runCompletions()
        }
        
        return result
    }
    
    // MARK: - Completions -
    private func runCompletions() {
        
        if let completion = nextCompletion {
            
            nextCompletion = nil
            completion()
        }
    }
    
    // MARK: - Alongsize Animation -
    func alongsideTransitionForPushing(viewController: UIViewController) -> ((UIViewControllerTransitionCoordinatorContext) -> Void)? {
        return nil
    }
    
    func alongsideTransitionForPopping(viewControllers: [UIViewController]) -> ((UIViewControllerTransitionCoordinatorContext) -> Void)? {
        return nil
    }
    
    // MARK: - Routing Methods -
    func push(_ viewController: UIViewController, animated: Bool = true, completion: @escaping (() -> Void) = {}) {
        
        nextCompletion = completion
        pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true, completion: @escaping (() -> Void) = {}) {
        
        nextCompletion = completion
        let _ = popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true, completion: @escaping (() -> Void) = {}) {
        
        nextCompletion = completion
        let _ = popToRootViewController(animated: animated)
    }
    
    // MARK: - Async Routing Methods -
    func pushAsync(_ viewController: UIViewController, animated: Bool = true, completion: @escaping (() -> Void) = {}) {
        
        let asyncCompletion = {
            
            DispatchQueue.main.async {
                completion()
            }
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.push(viewController, animated: animated, completion: asyncCompletion)
        }
    }
    
    func popAsync(animated: Bool = true, completion: @escaping (() -> Void)) {
        
        let asyncCompletion = {
            
            DispatchQueue.main.async {
                completion()
            }
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.pop(animated: animated, completion: asyncCompletion)
        }
    }
    
    func popToRootAsync(animated: Bool = true, completion: @escaping (() -> Void) = {}) {
        
        let asyncCompletion = {
            
            DispatchQueue.main.async {
                completion()
            }
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.popToRoot(animated: animated, completion: asyncCompletion)
        }
    }
}


