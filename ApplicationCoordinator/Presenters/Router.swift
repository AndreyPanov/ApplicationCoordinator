//
//  Router.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 19/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol Router: Presentable {
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
    
    func popModule()
    func popModule(animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> ())?)
    
    func setRootModule(_ module: Presentable?)
    func popToRootModule(animated: Bool)
}
