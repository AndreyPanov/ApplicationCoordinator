//
//  ItemCreateOutput.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 17.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

protocol ItemCreateView: BaseView {
    var onHideButtonTap: (() -> ())? { get set }
    var onCompleteCreateItem: ((ItemList) -> ())? { get set }
}
