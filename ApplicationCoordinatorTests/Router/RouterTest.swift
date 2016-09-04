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
    
    var currentRootController: UIViewController?
    var window = UIWindow()
    var currentWindow: UIWindow!
    
    var firstController: UIViewController!
    var secondController: UIViewController!
    var thirdController: UIViewController!
    
    override func setUp() {
        super.setUp()
        
        // our rootController is UITabBarController, but we need to test
        // present and dismiss Router protocol methods
        // we create new window and set rootController as UINavigationController
        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
        currentWindow = delegate?.window
        currentRootController =  window.rootViewController
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        router = RouterMock(rootController: navigationController)
        
        firstController = ItemsListController.controllerFromStoryboard(.Items)
        secondController = ItemDetailController.controllerFromStoryboard(.Items)
        thirdController = SettingsController.controllerFromStoryboard(.Settings)
    }
    
    override func tearDown() {
        // after tests finished we need to restore window state for using in another tests
        router = nil
        window.rootViewController = currentRootController
        window.resignKeyWindow()
        window.hidden = true
        currentWindow.makeKeyAndVisible()
        
        firstController = nil
        secondController = nil
        thirdController = nil
        
        super.tearDown()
    }
    
    func testRouterSetRootController() {
        
        router?.setRootController(firstController)
        XCTAssertTrue(router?.rootController?.viewControllers.first is ItemsListController)
    }
    
    func testRouterPushViewController() {
        
        router?.setRootController(firstController)
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemsListController)
        router?.push(secondController)
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemDetailController)
    }
    
    func testRouterPopViewController() {
        
        router?.setRootController(firstController)
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemsListController)
        router?.push(secondController)
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemDetailController)
        
        router?.popController()
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemsListController)
    }
    
    func testRouterPopToRootViewController() {
        
        router?.setRootController(firstController)
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemsListController)
        router?.push(secondController)
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemDetailController)
        router?.push(thirdController)
        XCTAssertTrue(router?.rootController?.viewControllers.last is SettingsController)
        
        router?.popToRootController(false)
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemsListController)
    }
    
    func testPresentViewController() {
        router?.present(secondController)
        XCTAssertTrue(router?.rootController?.presentedViewController is ItemDetailController)
    }
    
    func testDismissViewController() {
        
        let expectation = expectationWithDescription("dismissBlock")
        router?.present(secondController)
        XCTAssertTrue(router?.rootController?.presentedViewController is ItemDetailController)
        router?.dismissController(false) { [weak self] in
            XCTAssertTrue(self?.router?.rootController?.presentedViewController == nil)
            expectation.fulfill()
        }
        waitForExpectationsWithTimeout(15, handler: nil)
    }
}