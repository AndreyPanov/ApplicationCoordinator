//
//  TermsControllerOutput.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 25/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol TermsControllerOutput: FlowControllerOutput {
    var onPopController: (Bool -> ())? { get set }
}