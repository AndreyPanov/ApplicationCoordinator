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
    
    case Navigation(NavigationPresenter)
    case TabBar(TabbarPresenter)
    
    init(navigationPresenter: NavigationPresenter) {
        self = .Navigation(navigationPresenter)
    }
    
    init(tabBarPresenter: TabbarPresenter) {
        self = .TabBar(tabBarPresenter)
    }

    func presenter() -> NavigationPresenter? {
        switch self {
        case .Navigation(let navigationPresenter):
            return navigationPresenter
        default: return nil
        }
    }
    
    func presenter() -> TabbarPresenter? {
        switch self {
        case .TabBar(let tabbarPresenter):
            return tabbarPresenter
        default: return nil
        }
    }
    
}