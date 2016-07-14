//
//  SignUpFlowOutput.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 17.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol SignUpFlowInput: FlowControllerInput {
    func conformTermsAgreement(agree: Bool)
}

protocol SignUpFlowOutput: FlowControllerOutput {
    var onSignUpComplete: (() -> ())? { get set }
    var onTermsButtonTap: (() -> ())? { get set }
}