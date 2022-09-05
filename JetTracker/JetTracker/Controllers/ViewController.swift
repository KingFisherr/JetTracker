//
//  ViewController.swift
//  JetTracker
//
//  Created by Tahsin Provath on 7/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    
    struct Cells{
        static let customCell = "customcell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TITLE"
        // Fetch Data
        configureTableView()
    }
    
    // Configure the table view

    func configureTableView(){
        // Add tableview to view
        view.addSubview(tableView)
        // Set Delegates
        setTableViewDelegates()
        // Set row height
        tableView.rowHeight = 100
        // Register Cells
        tableView.register(Cell.self, forCellReuseIdentifier: Cells.customCell)
        // Set Constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        // Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.customCell) as! Cell // We want fucn from cell file
        
        
        return cell
    }
    
}
