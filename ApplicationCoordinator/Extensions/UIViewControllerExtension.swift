//
//  UIViewControllerExtension.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 22.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private class func instantiateControllerInStoryboard<T: UIViewController>(storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewControllerWithIdentifier(identifier) as! T
    }
    
    class func controllerInStoryboard(storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    class func controllerInStoryboard(storyboard: UIStoryboard) -> Self {
        return controllerInStoryboard(storyboard, identifier: nameOfClass)
    }
    
    class func controllerFromStoryboard(storyboard: Storyboards) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: nameOfClass)
    }
}

enum Storyboards: String {
    
    case Main = "Main"
    case Items = "Items"
    case Auth = "Auth"
    case Create = "Create"
    case Settings = "Settings"
}