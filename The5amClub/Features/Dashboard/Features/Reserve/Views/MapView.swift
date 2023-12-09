//
//  MapVIew.swift
//  The5amClub
//
//  Created by Rhymetech on 24/12/22.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @ObservedObject var mapVM: MapViewModelImpl

    func makeCoordinator() -> Coordinator {
        return MapView.Coordinator()
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = mapVM.mapView
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            // custom pins, excluding user blue circle
            if annotation.isKind(of: MKUserLocation.self) { return nil }

            let pinAnnotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "PIN_VIEW")
            pinAnnotation.tintColor = .red
            pinAnnotation.animatesDrop = true
            pinAnnotation.canShowCallout = true

            return pinAnnotation
        }
    }
}
