//
//  ItemsListController.swift
//  ApplicationCoordinator
//
//  Created by Andrey Panov on 23/04/16.
//  Copyright © 2016 Andrey Panov. All rights reserved.
//

import UIKit

final class ItemsListController: UIViewController, ItemsListFlowOutput {
    
    //controller handler
    var authNeed: (() -> ())?
    var onItemSelect: (ItemList -> ())?
    var onCreateButtonTap: (() -> ())?
    
    @IBOutlet weak var tableView: UITableView!
    //mock datasource
    var items = (0...10).map { index in return ItemList(title: "Item № \(index)", subtitle: "Item descripton") }
    var authCheck = false

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Items"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add,
                                                            target: self,
                                                            action: #selector(ItemsListController.addItemButtonClicked(_:)))
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if !authCheck {
            authNeed?()
            authCheck = true
        }
    }
    
    @IBAction func addItemButtonClicked(sender: UIBarButtonItem) {
        onCreateButtonTap?()
    }
}

extension ItemsListController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        onItemSelect?(items[indexPath.row])
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
