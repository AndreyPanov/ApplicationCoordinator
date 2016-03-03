//
//  ApplicationCoordinator.swift
//  ApplicationCoordinatorExample
//
//  Created by Andrey Panov on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

typealias CompletionBlock = () -> ()

@objc protocol Coordinatable {
    
    optional var completionHandler:CompletionBlock? {get set}
    init(rootController: UINavigationController)
    func start()
}

protocol Controllerable: NSObjectProtocol {
    typealias T
    var completionHandler: (T -> ())? {get set}
}

class ApplicationCoordinator: NSObject, Coordinatable {
    
    private(set) var rootController: UINavigationController

    required init(rootController: UINavigationController) {
        
        self.rootController = rootController
        super.init()
    }
    
    func start() {
        
        isLoggedIn() ? showItems() : showAuth()
    }
    
    func isLoggedIn() -> Bool {
        
        //here we call some func to check user session
        //in this example just return false
        return false
    }
    
    func showAuth() {
        
        let authenticationCoordinator = AuthenticationCoordinator(rootController: rootController)
        authenticationCoordinator.completionHandler = {
            self.showItems()
        }
        authenticationCoordinator.start()
    }
    
    func showItems() {
        
        let itemsCoordinator = ItemsCoordinator(rootController: rootController)
        itemsCoordinator.completionHandler = {
            // some
        }
        itemsCoordinator.start()
    }
}
