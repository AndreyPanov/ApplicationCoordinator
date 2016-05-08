//
//  UIViewExtensions.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 08.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

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