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

final class NavigationPresenter: Presenter {
    weak var rootController: UINavigationController?
}
final class TabBarPresenter: Presenter {
    weak var rootController: UITabBarController?
}
final class PageViewPresenter: Presenter {
    weak var rootController: UIPageViewController?
}
enum PresenterBox {
    case Navigation(NavigationPresenter)
    case TabBar(TabBarPresenter)
    case PageView(PageViewPresenter)
    
    init(navigationPresenter: NavigationPresenter) {
        self = .Navigation(navigationPresenter)
    }
    init(tabBarPresenter: TabBarPresenter) {
        self = .TabBar(tabBarPresenter)
    }
    init(pageViewPresenter: PageViewPresenter) {
        self = .PageView(pageViewPresenter)
    }
}