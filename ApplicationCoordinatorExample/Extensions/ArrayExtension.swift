//
//  ArrayExtension.swift
//  ApplicationCoordinatorExample
//
//  Created by Панов Андрей on 22.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func removeObject<U: Equatable>(object: U) {
        
        var index: Int?
        for (idx, objectToCompare) in self.enumerate() {
            
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if let indexUnwrapped = index {
            self.removeAtIndex(indexUnwrapped)
        }
    }
}