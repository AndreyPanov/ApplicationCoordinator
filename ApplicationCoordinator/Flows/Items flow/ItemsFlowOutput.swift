//
//  ItemsFlowInputOutput.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 15.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol ItemsFlowOutput: FlowControllerOutput {
    var authCheckNeed: (() -> ())? { get set }
    var onItemSelect: (ItemList -> ())? { get set }
    var onCreateButtonTap: (() -> ())? { get set }
}