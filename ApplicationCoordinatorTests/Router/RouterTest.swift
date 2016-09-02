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
    
    func testRouterPushViewController() {
        
        let controller = ItemsListController.controllerFromStoryboard(.Items)
        router?.push(controller)
        XCTAssertTrue(router?.rootController?.viewControllers.first is ItemsListController)
    }
    
    func testRouterSetRootController() {
        
        let controller = ItemsListController.controllerFromStoryboard(.Items)
        router?.setRootController(controller)
        XCTAssertTrue(router?.rootController?.viewControllers.first is ItemsListController)
    }
    
    
}


/*
 unc present(controller: UIViewController?) {
 present(controller, animated: false)
 }
 func present(controller: UIViewController?, animated: Bool) {
 guard let controller = controller else { return }
 rootController?.presentViewController(controller, animated: false, completion: nil)
 }
 
 func push(controller: UIViewController?)  {
 push(controller, animated: false)
 }
 
 func push(controller: UIViewController?, animated: Bool)  {
 guard
 let controller = controller
 where (controller is UINavigationController == false)
 else { assertionFailure("Deprecated push UINavigationController."); return }
 
 rootController?.pushViewController(controller, animated: false)
 }
 
 func popController()  {
 popController(false)
 }
 
 func popController(animated: Bool)  {
 rootController?.popViewControllerAnimated(false)
 }
 
 func dismissController() {
 dismissController(false)
 }
 
 func dismissController(animated: Bool) {
 rootController?.dismissViewControllerAnimated(false, completion: nil)
 }
 
 func setRootController(controller: UIViewController?) {
 guard let controller = controller else { return }
 
 rootController?.setViewControllers([controller], animated: false)
 }

 */