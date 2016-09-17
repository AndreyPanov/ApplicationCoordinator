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
    
    fileprivate var router: RouterMock!
    
    fileprivate var firstController: UIViewController!
    fileprivate var secondController: UIViewController!
    fileprivate var thirdController: UIViewController!
    
    override func setUp() {
        super.setUp()
        
        router = RouterMockImp()
        firstController = ItemsListController.controllerFromStoryboard(.Items)
        secondController = ItemDetailController.controllerFromStoryboard(.Items)
        thirdController = SettingsController.controllerFromStoryboard(.Settings)
    }
    
    override func tearDown() {
        
        router = nil
        firstController = nil
        secondController = nil
        thirdController = nil
        
        super.tearDown()
    }
    
    func testRouterSetRootController() {
        
        router.setRootController(firstController)
        XCTAssertTrue(router.navigationStack.first is ItemsListController)
    }
    
    func testRouterPushViewController() {
        
        router.setRootController(firstController)
        XCTAssertTrue(router.navigationStack.last is ItemsListController)
        router.push(secondController)
        XCTAssertTrue(router.navigationStack.last is ItemDetailController)
    }
    
    func testRouterPopViewController() {
        
        router.setRootController(firstController)
        XCTAssertTrue(router.navigationStack.last is ItemsListController)
        router.push(secondController)
        XCTAssertTrue(router.navigationStack.last is ItemDetailController)
        
        router.popController()
        XCTAssertTrue(router.navigationStack.last is ItemsListController)
    }
    
    func testRouterPopToRootViewController() {
        
        router.setRootController(firstController)
        XCTAssertTrue(router.navigationStack.last is ItemsListController)
        router.push(secondController)
        XCTAssertTrue(router.navigationStack.last is ItemDetailController)
        router.push(thirdController)
        XCTAssertTrue(router.navigationStack.last is SettingsController)
        
        router.popToRootController(animated: false)
        XCTAssertTrue(router.navigationStack.last is ItemsListController)
    }
    
    func testPresentViewController() {
        router.present(secondController)
        XCTAssertTrue(router.presented is ItemDetailController)
    }
    
    func testDismissViewController() {
        
        router.present(secondController)
        XCTAssertTrue(router.presented is ItemDetailController)
        router.dismissController()
        XCTAssertTrue(router.presented == nil)
    }
}
