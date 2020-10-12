//
//  LocationPersistance.swift
//  bgweather
//
//  Created by Alejandro Agudelo on 11/10/20.
//  Copyright © 2020 Alejandro Agudelo. All rights reserved.
//

import Foundation
import MapKit

class LocationsPersitance {
    private init() {
        locations = [CLLocationCoordinate2D]()
    }
    
    static let shared = LocationsPersitance()
    var locations: [CLLocationCoordinate2D]
}
