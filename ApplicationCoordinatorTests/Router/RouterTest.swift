//
//  RouterTest.swift
//  ApplicationCoordinator
//
//  Created by Andrey on 02.09.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import XCTest
@testable import ApplicationCoordinator

class RouterTest: XCTestCase {
    
    private var router: RouterMock!
    
    private var firstController: UIViewController!
    private var secondController: UIViewController!
    private var thirdController: UIViewController!
    
    override func setUp() {
        super.setUp()
        
        router = RouterMockImp()
        firstController = ItemsListController.controllerFromStoryboard(.items)
        secondController = ItemDetailController.controllerFromStoryboard(.items)
        thirdController = SettingsController.controllerFromStoryboard(.settings)
    }
    
    override func tearDown() {
        
        router = nil
        firstController = nil
        secondController = nil
        thirdController = nil
        
        super.tearDown()
    }
    
    func testRouterSetRootModule() {
        
        router.setRootModule(firstController)
        XCTAssertTrue(router.navigationStack.first is ItemsListController)
    }
    
    func testRouterPushViewModule() {
        
        router.setRootModule(firstController)
        XCTAssertTrue(router.navigationStack.last is ItemsListController)
        router.push(secondController)
        XCTAssertTrue(router.navigationStack.last is ItemDetailController)
    }
    
    func testRouterPopViewModule() {
        
        router.setRootModule(firstController)
        XCTAssertTrue(router.navigationStack.last is ItemsListController)
        router.push(secondController)
        XCTAssertTrue(router.navigationStack.last is ItemDetailController)
        
        router.popModule()
        XCTAssertTrue(router.navigationStack.last is ItemsListController)
    }
    
    func testRouterPopToRootViewModule() {
        
        router.setRootModule(firstController)
        XCTAssertTrue(router.navigationStack.last is ItemsListController)
        router.push(secondController)
        XCTAssertTrue(router.navigationStack.last is ItemDetailController)
        router.push(thirdController)
        XCTAssertTrue(router.navigationStack.last is SettingsController)
        
        router.popToRootModule(animated: false)
        XCTAssertTrue(router.navigationStack.last is ItemsListController)
    }
    
    func testPresentViewModule() {
        router.present(secondController)
        XCTAssertTrue(router.presented is ItemDetailController)
    }
    
    func testDismissViewModule() {
        
        router.present(secondController)
        XCTAssertTrue(router.presented is ItemDetailController)
        router.dismissModule()
        XCTAssertTrue(router.presented == nil)
    }
}
