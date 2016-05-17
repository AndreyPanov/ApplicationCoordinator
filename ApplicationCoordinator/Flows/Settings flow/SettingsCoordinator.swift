//
//  SettingsCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

class SettingsCoordinator: BaseCoordinator {

    var factory: SettingsControllersFactory
    var presenter: NavigationPresenter?
    
    init(presenter: NavigationPresenter) {
        
        factory = SettingsControllersFactory()
        self.presenter = presenter
    }
    
    override func start() {
        showSettings()
    }
    
    //MARK: - Run current flow's controllers
    
    func showSettings() {
        
        let settingsFlowBox = factory.createSettingsBox()
        presenter?.push(settingsFlowBox.controller, animated: false)
    }
}