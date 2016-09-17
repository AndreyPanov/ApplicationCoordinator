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
    
    fileprivate var coordinator: Coordinator!
    fileprivate var routerNavigationStack: [UIViewController]!
    fileprivate var routerPresentedController: UIViewController?

    override func setUp() {
        super.setUp()
        
        let routerMock = RouterMock()
        routerNavigationStack = routerMock.navigationStack
        routerPresentedController = routerMock.presented
        
        coordinator = SettingsCoordinator(router: routerMock, factory: ControllersFactoryImp())
    }
    
    override func tearDown() {
        coordinator = nil
        routerNavigationStack = nil
        routerPresentedController = nil
        
        super.tearDown()
    }
    
    func testStart() {
        coordinator.start()
        // after start() call coordinator must push SettingsController
        XCTAssertTrue(routerNavigationStack.first is SettingsController)
        XCTAssertTrue(routerNavigationStack.count == 1)
    }
}
