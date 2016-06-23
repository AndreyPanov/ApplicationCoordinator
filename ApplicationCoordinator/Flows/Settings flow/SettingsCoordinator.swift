//
//  SettingsCoordinator.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

final class SettingsCoordinator: BaseCoordinator {

    var factory: SettingsControllersFactory
    var router: Router
    
    init(router: Router,
        factory: SettingsControllersFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showSettings()
    }
    
    //MARK: - Run current flow's controllers
    
    private func showSettings() {
        let settingsFlowOutput = factory.createSettingsOutput()
        router.push(settingsFlowOutput.toPresent(), animated: false)
    }
}