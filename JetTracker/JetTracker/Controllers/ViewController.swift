//
//  ViewController.swift
//  JetTracker
//
//  Created by Tahsin Provath on 7/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    // In Class VC initialize TbleView
    var tableView = UITableView()
    
    var API = Network()
    
    // Struct Cells holds a static name value
    struct Cells{
        static let customCell = "customcell"
    }
    
    // When view loads initially
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HOME"
        // Fetch Data
        API.fetchFlights {
            self.tableView.reloadData()
        }
        
        // Config the table view
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
    
    // Sets tableview delgates
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
}

// Conform to tableview protocols
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Count of data in array
        return API.Flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.customCell) as! Cell // We want func from cell file
        cell.button.setImage(UIImage(systemName: "square.and.arrow.down.fill"), for: .normal)
//        let flightd = API.Flights[indexPath.row]
//        cell.set(flight: "flightd")
        cell.titleLabel.text = API.Flights[indexPath.row].departure.airport
        return cell
    }
    
    
}
