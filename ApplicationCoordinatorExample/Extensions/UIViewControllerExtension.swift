//
//  UIViewControllerExtension.swift
//  ApplicationCoordinatorExample
//
//  Created by Панов Андрей on 22.02.16.
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

private extension NSObject {
    
    class var nameOfClass: String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last!
    }
}

extension UIView {
    
    private class func viewInNibNamed<T: UIView>(nibNamed: String) -> T {
        
        return NSBundle.mainBundle().loadNibNamed(nibNamed, owner: nil, options: nil).first as! T
    }
    
    class func nib() -> Self {
        
        return viewInNibNamed(nameOfClass)
    }
    
    class func nib(frame: CGRect) -> Self {
        
        let view = nib()
        view.frame = frame
        view.layoutIfNeeded()
        
        return view
    }
}

enum Storyboards: String {
    
    case Main = "Main"
    case Items = "Items"
    case Auth = "Auth"
    
}