//
//  SettingsController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class SettingsController: UIViewController, SettingsFlowOutput {

    //controller handler
    
    @IBOutlet weak var tableView: UITableView!
    //mock datasource
    var settings: [[Setting]] = [[]]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
        createMockData()
    }
    
    func createMockData() {
        
        let settings1 = (0...3).map { index in return Setting(title: "Setting № \(index)", subtitle: "Setting descripton") }
        let settings2 = (0...5).map { index in return Setting(title: "Setting № \(index)", subtitle: "Setting descripton") }
        settings.append(settings1)
        settings.append(settings2)
    }
}

extension SettingsController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let setting = settings[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        cell.textLabel?.text = setting.title
        cell.detailTextLabel?.text = setting.subtitle
        return cell
    }
}
