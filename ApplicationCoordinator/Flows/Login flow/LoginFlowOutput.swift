//
//  LoginFlowOutput.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 17.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol LoginFlowOutput: FlowControllerOutput {
    var onHideButtonTap: (() -> ())? { get set }
    var onCompleteCreateItem: (() -> ())? { get set }
    var onSignUpButtonTap: (() -> ())? { get set }
}