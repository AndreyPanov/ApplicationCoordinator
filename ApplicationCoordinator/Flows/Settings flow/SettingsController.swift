//
//  SettingsController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    //controller handler
    typealias T = SettingsActions //enum Actions type
    var completionHandler: (T -> ())?
    
    @IBOutlet weak var tableView: UITableView!
    //mock datasource
    var settings = (0...5).map { index in return Setting(title: "Setting № \(index)", subtitle: "Setting descripton") }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"
    }
}

extension SettingsController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let setting = settings[indexPath.row]
        cell.textLabel?.text = setting.title
        cell.detailTextLabel?.text = setting.subtitle
        return cell
    }
}