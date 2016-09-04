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
    
    var coordinator: Coordinator!
    var router: Router!

    override func setUp() {
        super.setUp()
        router = RouterMock(rootController: UINavigationController())
        coordinator = SettingsCoordinator(router: router,
                                                  factory: ControllersFactoryImp())
    }
    
    override func tearDown() {
        coordinator = nil
        router = nil
        super.tearDown()
    }
    
    func testStart() {
        coordinator.start()
        // after start() call coordinator must push SettingsController
        XCTAssertTrue(router.rootController?.viewControllers.first is SettingsController)
    }
}
