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
}