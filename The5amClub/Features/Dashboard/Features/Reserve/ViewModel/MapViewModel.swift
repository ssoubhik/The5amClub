//
//  MapViewModel.swift
//  The5amClub
//
//  Created by Rhymetech on 24/12/22.
//

import SwiftUI
import MapKit
import CoreLocation

// MARK: - Map View Model Implementation

class MapViewModelImpl: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var mapView = MKMapView()
    @Published var region: MKCoordinateRegion!
    @Published var permissionDenied = false
    @Published var mapType: MKMapType = .standard
    @Published var searchText = ""
    @Published var places: [Place] = []

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // checking permissions
        switch manager.authorizationStatus {
        case .denied:
            // permission denied
            permissionDenied.toggle()
        case .notDetermined:
            // requesting
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            // permission given
            manager.requestLocation()
        default:
            ()
        }
    }

    // Method: location manager error handler
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // error
        print(error.localizedDescription)
    }

    // Method: update location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }

    // Method: update maptype
    func updateMapType() {
        if mapType == .standard {
            mapType = .hybrid
            mapView.mapType = mapType
        } else {
            mapType = .standard
            mapView.mapType = mapType
        }
    }

    // Method: focus on current location
    func focusLocation() {
        guard let _ = region else { return }
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }

    // Method: search query
    func searchQuery() {
        places.removeAll()
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText

        MKLocalSearch(request: request).start { [weak self] response, _ in
            guard let result = response else { return }

            self?.places = result.mapItems.compactMap({ item -> Place? in
                return Place(placemark: item.placemark)
            })
        }
    }

    // Method: pick search result
    func selectPlace(place: Place) {
        searchText.removeAll()

        guard let coordinate = place.placemark.location?.coordinate else { return }
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.coordinate = coordinate
        pointAnnotation.title = place.placemark.name ?? "No Name"

        // removing old ones
        mapView.removeAnnotations(mapView.annotations)

        // adding new one
        mapView.addAnnotation(pointAnnotation)

        // moving map to that location
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)

        mapView.setRegion(coordinateRegion, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
}
