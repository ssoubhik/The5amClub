//
//  Place.swift
//  The5amClub
//
//  Created by Rhymetech on 24/12/22.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID().uuidString
    var placemark: CLPlacemark
}
