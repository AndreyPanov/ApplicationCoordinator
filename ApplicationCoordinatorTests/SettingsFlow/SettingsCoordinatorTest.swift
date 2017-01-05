//
//  SettingsCoordinatorTest.swift
//  ApplicationCoordinator
//
//  Created by Андрей on 04.09.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import XCTest
@testable import ApplicationCoordinator

class SettingsCoordinatorTest: XCTestCase {
    
    private var coordinator: Coordinator!
    private var router: RouterMock!

    override func setUp() {
        super.setUp()
        
        router = RouterMockImp()
        coordinator = SettingsCoordinator(router: router, factory: ControllersFactoryImp())
    }
    
    override func tearDown() {
        coordinator = nil
        router = nil
        
        super.tearDown()
    }
    
    func testStart() {
        coordinator.start()
        // after start() call coordinator must push SettingsController
        XCTAssertTrue(router.navigationStack.first is SettingsController)
        XCTAssertTrue(router.navigationStack.count == 1)
    }
}
