//
//  ItemCoordinatorTest.swift
//  ApplicationCoordinator
//
//  Created by Андрей on 18.09.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import XCTest
@testable import ApplicationCoordinator

class ItemCoordinatorTest: XCTestCase {
    
    fileprivate var coordinator: Coordinator!
    fileprivate var router: RouterMock!
    
    fileprivate var itemListOutput: ItemsListView!
    fileprivate var itemDetailOutput: ItemDetailView!
    
    override func setUp() {
        super.setUp()
        
        router = RouterMockImp()
        let itemListController = ItemsListController.controllerFromStoryboard(.items)
        let itemDetailController = ItemDetailController.controllerFromStoryboard(.items)
        let factory = ItemControllersFactoryMock(itemListController: itemListController, itemDetailCntroller: itemDetailController)
        coordinator = ItemCoordinator(router: router,
                                      factory: factory,
                                      coordinatorFactory: CoordinatorFactoryImp())
        itemListOutput = itemListController
        itemDetailOutput = itemDetailController
        
    }
    
    override func tearDown() {
        coordinator = nil
        router = nil
        itemListOutput = nil
        itemDetailOutput = nil
        
        super.tearDown()
    }
    
    func testStart() {
        
        coordinator.start()
        // login controller must be in navigation stack
        XCTAssertTrue(router.navigationStack.first is ItemsListController)
        XCTAssertTrue(router.navigationStack.count == 1)
    }
    
    func testShowItemDetail() {
        
        coordinator.start()
        itemListOutput.onItemSelect!(ItemList(title: "", subtitle: ""))
        XCTAssertTrue(router.navigationStack.last is ItemDetailController)
        XCTAssertTrue(router.navigationStack.count == 2)
        
    }
    
    
}
/*
 itemsOutput.authNeed = { [weak self] in
 self?.runAuthCoordinator()
 }
 itemsOutput.onItemSelect = { [weak self] (item) in
 self?.showItemDetail(item)
 }
 itemsOutput.onCreateButtonTap = { [weak self] in
 self?.runCreationCoordinator()
 }
 */
final class ItemControllersFactoryMock: ItemControllersFactory {
    
    fileprivate let itemListController: ItemsListController
    fileprivate let itemDetailCntroller: ItemDetailController
    
    init(itemListController: ItemsListController,
         itemDetailCntroller: ItemDetailController) {
        
        self.itemListController = itemListController
        self.itemDetailCntroller = itemDetailCntroller
    }
    
    func makeItemsOutput() -> ItemsListView {
        return itemListController
    }
    
    func makeItemDetailOutput(item: ItemList) -> ItemDetailView {
        return itemDetailCntroller
    }
}
