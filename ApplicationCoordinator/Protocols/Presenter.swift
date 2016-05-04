//
//  Presenter.swift
//  ApplicationCoordinator
//
//  Created by Панов Андрей on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//
import UIKit

protocol Presenter: class {
    associatedtype T
    var navigationController: T? {get set}
}