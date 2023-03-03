//
//  FlightMapVC.swift
//  JetTracker
//
//  Created by Tahsin Provath on 3/2/23.
//

import Foundation
import UIKit
import MapKit

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
