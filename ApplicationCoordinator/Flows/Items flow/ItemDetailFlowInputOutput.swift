//
//  ItemDetailFlowInputOutput.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 16/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol ItemDetailFlowInput: FlowControllerInput {
    var itemList: ItemList? { get set }
}

protocol ItemDetailFlowOutput: FlowControllerOutput {
}