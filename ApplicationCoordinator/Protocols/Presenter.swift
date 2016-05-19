//
//  Presenter.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//
import UIKit

protocol Presenter: class {
    
    associatedtype ViewController: UIViewController
    weak var rootController: ViewController? {get set} // UINavigationController, UITabbarController, UIPageViewController etc
}

enum PresenterBox {
    /*
    case Navigation(NavigationPresenter)
    
    init(navigationPresenter: NavigationPresenter) {
        self = .Navigation(navigationPresenter)
    }
    
    func presenter() -> NavigationPresenter? {
        switch self {
        case .Navigation(let navigationPresenter):
            return navigationPresenter
        default: return nil
        }
    }
    */
}