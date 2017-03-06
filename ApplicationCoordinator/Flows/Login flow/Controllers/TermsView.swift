//
//  TermsView.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 25/05/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol TermsView: BaseView {
    var confirmed: Bool { get set }
    
    var onConfirmChanged: ((Bool) -> ())? { get set }
}
