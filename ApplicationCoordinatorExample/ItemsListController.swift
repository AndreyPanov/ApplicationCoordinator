//
//  ItemsListController.swift
//  ApplicationCoordinatorExample
//
//  Created by Панов Андрей on 21.02.16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

class ItemsListController: UITableViewController {
    
    var complitionHandler: Optional<ItemAction -> ()> = nil
    var dataSource = ["Cat", "Dog", "Bear"]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ItemsListController"
    }
    
    //MARK: - Table Datasource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AnimalCell")!
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let handler = complitionHandler {
            
            handler(.OpenDetail(dataSource[indexPath.row]))
        }
    }
}
