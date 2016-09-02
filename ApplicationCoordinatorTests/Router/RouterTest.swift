//
//  RouterTest.swift
//  ApplicationCoordinator
//
//  Created by Андрей on 02.09.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import XCTest
@testable import ApplicationCoordinator

class RouterTest: XCTestCase {
    
    var router: Router?
    
    override func setUp() {
        super.setUp()
        router = RouterMock(rootController: UINavigationController())
    }
    
    override func tearDown() {
        router = nil
        super.tearDown()
    }
    
    
}
