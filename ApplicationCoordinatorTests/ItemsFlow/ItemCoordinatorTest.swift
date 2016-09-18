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
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
}

final class ItemControllersFactoryMock: ItemControllersFactory {
    
    fileprivate let itemListController: ItemsListController
    fileprivate let itemDetailCntroller: ItemDetailController
    
    init(itemListController: ItemsListController,
         itemDetailCntroller: ItemDetailController) {
        
        self.itemListController = itemListController
        self.itemDetailCntroller = itemDetailCntroller
    }
    
    func createItemsOutput() -> ItemsListFlowOutput {
        return itemListController
    }
    
    func createItemDetailOutput(item: ItemList) -> ItemDetailFlowOutput {
        return itemDetailCntroller
    }
}
