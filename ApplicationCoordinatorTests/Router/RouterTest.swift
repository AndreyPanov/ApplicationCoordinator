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
    
    func testRouterSetRootController() {
        
        let controller = ItemsListController.controllerFromStoryboard(.Items)
        router?.setRootController(controller)
        XCTAssertTrue(router?.rootController?.viewControllers.first is ItemsListController)
    }
    
    func testRouterPushViewController() {
        
        let firstController = ItemsListController.controllerFromStoryboard(.Items)
        let secondController = ItemDetailController.controllerFromStoryboard(.Items)
        
        router?.setRootController(firstController)
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemsListController)
        router?.push(secondController)
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemDetailController)
    }
    
    func testRouterPopViewController() {
        
        let firstController = ItemsListController.controllerFromStoryboard(.Items)
        let secondController = ItemDetailController.controllerFromStoryboard(.Items)
        
        router?.setRootController(firstController)
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemsListController)
        router?.push(secondController)
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemDetailController)
        
        router?.popController()
        XCTAssertTrue(router?.rootController?.viewControllers.last is ItemsListController)
    }
    
    func testRouterPopToRootViewController() {
        
        let firstController = ItemsListController.controllerFromStoryboard(.Items)
        let secondController = ItemDetailController.controllerFromStoryboard(.Items)
        let thirdController = SettingsController.controllerFromStoryboard(.Settings)
        
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
        
        let controller = ItemsListController.controllerFromStoryboard(.Items)
        let secondController = ItemDetailController.controllerFromStoryboard(.Items)
        router?.push(controller)
        router?.present(secondController)
        XCTAssertTrue(router?.rootController?.presentedViewController is ItemsListController)
    }
}