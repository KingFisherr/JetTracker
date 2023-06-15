//
//  DestinationsVC.swift
//  JetTracker
//
//  Created by Tahsin Provath on 3/2/23.
//

import Foundation
import UIKit


class DestinationsVC: UIViewController {
    var tableView = UITableView()
    let departureDatePicker = UIDatePicker()

    struct Cells{
        static let customCell = "customcell"
    }
    override func viewDidLoad() {
    
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = "Search By Date"
       // self.tableView.reloadData()
       // configureTableView()
     
        departureDatePicker.datePickerMode = .date
        departureDatePicker.setDate(Date(), animated: false)
        departureDatePicker.frame = CGRect(x: CGFloat(95), y: CGFloat(10), width: CGFloat(200), height: CGFloat(216))

        view.addSubview(departureDatePicker)

        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 125, height: 30))
        label.text = "Departure Date:"
        view.addSubview(label)
        var image = UIImage(named: "search-bar-icon")
        let button = UIButton()
        button.setImage(image, for: .normal)
        image = UIImage(named: "search-bar-icon-clicked")
        button.setImage(image, for: .highlighted)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.frame = CGRect(x: 320, y: 95, width: 50, height: 50)
        view.addSubview(button)
        //self.tableView.reloadData()
        configureTableView()
        
    }
    func configureTableView(){
        // Add tableview to view
        tableView = UITableView(frame: CGRect(x: 0, y: 170, width: view.frame.width, height:view.frame.height - 170))
        view.addSubview(tableView)
        // Set Delegates
        setTableViewDelegates()
        // Set row height
        tableView.rowHeight = 100
        // Register Cells
        tableView.register(Cell.self, forCellReuseIdentifier: Cells.customCell)
        // Set Constraints
       // tableView.pin(to: view)
    }
    
    // Sets tableview delgates
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    @objc func buttonTapped(_ sender: UIButton) {
            // Handle button tap event
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        // Format the selected date using the date formatter
        let selectedDate = dateFormatter.string(from: departureDatePicker.date)
        }
}
extension DestinationsVC: UITableViewDelegate, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // Count of data in array
            return 5
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.customCell) as! Cell // We want func from cell file
    //        let flightd = API.Flights[indexPath.row]
    //        cell.set(flight: "flightd")
            cell.titleLabel.text = "Date"
            return cell
        }
        
    }
    
    
    

//
//In this example, we use two cell identifiers: tableCellIdentifier for the UITableViewCell in the UITableView and collectionCellIdentifier for the UICollectionViewCell in the UICollectionView. We also have an array of image names called images.
//
//In the tableView(_:cellForRowAt:) function, we set up the UICollectionView by creating a UICollectionViewFlowLayout, registering the UICollectionViewCell, setting the delegate and data source to the view controller, and adding it as a subview of the cell's content view.
//
//In the collectionView(_:cellForItemAt:) function, we set up the UIImageView by creating an image view, setting the content mode to .scaleAspectFill, setting clipsToBounds to true to prevent the image from bleeding out of the cell's bounds, and setting the image to a random image from the images array.
//
//Note that you may need to adjust the layout and size of the table view cell and collection view cell to fit your specific needs.










//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
//
//    let tableCellIdentifier = "tableCellIdentifier"
//    let collectionCellIdentifier = "collectionCellIdentifier"
//    let images = ["image1", "image2", "image3", "image4", "image5", "image6"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Set up the table view
//        let tableView = UITableView(frame: view.bounds, style: .plain)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableCellIdentifier)
//        tableView.delegate = self
//        tableView.dataSource = self
//        view.addSubview(tableView)
//    }
//
//    // MARK: - Table view data source
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10 // Set the number of rows you want to display
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath)
//
//        // Set up the collection view
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 100, height: 100)
//
//        let collectionView = UICollectionView(frame: cell.bounds, collectionViewLayout: layout)
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCellIdentifier)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.backgroundColor = .white
//
//        cell.contentView.addSubview(collectionView)
//
//        return cell
//    }
//
//    // MARK: - Collection view data source
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3 // Set the number of images you want to display in each cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath)
//
//        // Set up the image view
//        let imageView = UIImageView(frame: cell.contentView.bounds)
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.image = UIImage(named: images.randomElement()!)
//
//        cell.contentView.addSubview(imageView)
//
//        return cell
//    }
//}
//
