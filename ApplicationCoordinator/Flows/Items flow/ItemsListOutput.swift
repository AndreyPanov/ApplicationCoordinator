//
//  ItemsFlowInputOutput.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 15.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol ItemsListFlowOutput: FlowControllerOutput {
    var authNeed: (() -> ())? { get set }
    var onItemSelect: ((ItemList) -> ())? { get set }
    var onCreateButtonTap: (() -> ())? { get set }
}
