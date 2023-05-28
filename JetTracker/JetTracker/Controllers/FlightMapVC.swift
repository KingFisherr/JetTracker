//
//  FlightMapVC.swift
//  JetTracker
//
//  Created by Tahsin Provath on 3/2/23.
//

import Foundation
import UIKit
import MapKit


// We want to create a logic where a user can enter (city name) and then the map zooms into that (city location).
// Filter by airline (color coded)
// Use gps location to zoom into user location



// we need to create a button and then zoom into location.


class FlightMapVC: UIViewController {
    
//    let mapView : MKMapView = {
//        let map = MKMapView()
//        map.overrideUserInterfaceStyle = .dark
//        return map
//    }()
    
    var mapView = MKMapView()
    
    // weak var coordinateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.overrideUserInterfaceStyle = .dark
        mapView.delegate = self
        
        //coordinateTextField.delegate = self
        setMapConstraints()
        
        
        // create a button and set its properties
        let button = UIButton(type: .system)
        button.setTitle("Go!", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        // set the button's frame to a desired size
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)

        // center the button within its superview
        button.center = view.center
        // add the button to the mapView
        mapView.addSubview(button)

         //add a target action to the button
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    
    @objc func buttonTapped() {
        let coordinate = CLLocationCoordinate2D(latitude: 37.33182, longitude: -122.03118)
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mapView.setRegion(region, animated: true)
    }
    
    func setMapConstraints() {
        view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
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

// Add search functionality
//extension MapViewController: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
//        annotationView.animatesDrop = true
//        return annotationView
//    }
//}
//
//extension MapViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}
