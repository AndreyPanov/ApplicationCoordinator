//
//  Presenter.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 03.05.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//
import UIKit

protocol Presenter: class {
    associatedtype ViewController: UIViewController
    weak var rootController: ViewController? {get set}
}