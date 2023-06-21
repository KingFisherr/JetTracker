//  JetTracker

import Foundation
import UIKit
import MapKit

class FlightMapVC: UIViewController {

    var mapView = MKMapView()
    var searchController: UISearchController!
    var zoomButton: UIButton!
    //var searchTextField: UITextField!
    var currentAnnotation: MKPointAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MKMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        mapView.overrideUserInterfaceStyle = .dark
        //mapView.delegate = self
        setMapConstraints()
        
        
//        // create a button and set its properties
//        let button = UIButton(type: .system)
//        button.setTitle("Go!", for: .normal)
//        button.backgroundColor = .white
//        button.setTitleColor(.black, for: .normal)
//        // set the button's frame to a desired size
//        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
//
//        // center the button within its superview
//        button.center = view.center
//        // add the button to the mapView
//        mapView.addSubview(button)
//
//         //add a target action to the button
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Create the zoom button
        let zoomButton = UIButton(type: .system)
        zoomButton.setTitle("Zoom", for: .normal)
        zoomButton.backgroundColor = .green
        zoomButton.setTitleColor(.white, for: .normal)
        zoomButton.addTarget(self, action: #selector(zoomToLocation), for: .touchUpInside)
        // set the button's frame to a desired size
        //zoomButton.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
            
        // center the button within its superview
        zoomButton.center = view.center
        
        zoomButton.translatesAutoresizingMaskIntoConstraints = false
        mapView.addSubview(zoomButton)

        // Set the button's constraints
        NSLayoutConstraint.activate([
            zoomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            zoomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        // need to create a text field that takes user input
        // uses input to match with api flight
        // zoom in on that location...
        // Configure the search controller
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }

    @objc func zoomToLocation() {
        guard let annotation = mapView.annotations.first else {
            return
        }

        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 15000, longitudinalMeters: 15000)
        mapView.setRegion(region, animated: true)
    }
    
    @objc func buttonTapped() {
        let coordinate = CLLocationCoordinate2D(latitude: 74, longitude: 75)
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mapView.setRegion(region, animated: true)
    }
    
    func setMapConstraints() {
        view.addSubview(mapView)
        
//        mapView.translatesAutoresizingMaskIntoConstraints = false
//        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
//    @IBAction func searchButtonTapped(_ sender: Any) {
//        guard let coordinateString = coordinateTextField.text else { return }
//        let coordinates = coordinateString.split(separator: ",").compactMap({ Double($0.trimmingCharacters(in: .whitespaces)) })
//        guard coordinates.count == 2 else { return }
//
//        let latitude = coordinates[0]
//        let longitude = coordinates[1]
//        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//
//        let region = MKCoordinateRegion(center: location, latitudinalMeters: 500, longitudinalMeters: 500)
//        mapView.setRegion(region, animated: true)
//
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location
//        mapView.removeAnnotations(mapView.annotations)
//        mapView.addAnnotation(annotation)
//    }
}


extension FlightMapVC: MKMapViewDelegate {
  //DELEGATE FUNCTIONS
}

extension FlightMapVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            // Clear previous search results if the search text is empty
            mapView.removeAnnotations(mapView.annotations)
            currentAnnotation = nil
            return
        }

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText

        let search = MKLocalSearch(request: request)
        search.start { [weak self] (response, error) in
            guard let self = self, let mapItems = response?.mapItems else {
                // Handle the error or display a message if the search failed
                if let error = error as NSError?, error.code == -8 {
                    // Ignore the attribution error and continue with the search results
                    print("Attribution error occurred. Proceeding with search results.")
                } else {
                    print("Search error occurred: \(error?.localizedDescription ?? "")")
                }
                return
            }

            // Remove previous annotations
            self.mapView.removeAnnotations(self.mapView.annotations)

            // Add new annotations for search results
            for mapItem in mapItems {
                let annotation = MKPointAnnotation()
                annotation.coordinate = mapItem.placemark.coordinate
                annotation.title = mapItem.name
                self.mapView.addAnnotation(annotation)
                // handle for
            }
        }
    }
}

extension FlightMapVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Hide the keyboard
        searchController.isActive = false // Dismiss the search controller
        updateSearchResults(for: searchController)
    }
}
