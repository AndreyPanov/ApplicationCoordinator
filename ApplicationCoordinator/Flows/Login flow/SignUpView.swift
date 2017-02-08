//
//  SignUpFlowOutput.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 17.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol SignUpView: BaseView {
    
    var onSignUpComplete: (() -> ())? { get set }
    var onTermsButtonTap: (() -> ())? { get set }
    var confirmed: Bool { get set }

    func conformTermsAgreement(_ agree: Bool)
}
