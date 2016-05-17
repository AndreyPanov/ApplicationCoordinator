//
//  SignUpFlowOutput.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 17.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol SignUpFlowOutput: FlowControllerOutput {
    var onSignUpComplete: (() -> ())? { get set }
}
