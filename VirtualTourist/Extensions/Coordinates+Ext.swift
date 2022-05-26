//
//  Coordinates+Ext.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 26/05/22.
//

import CoreLocation
import VirtualTouristKit


public extension CLLocationCoordinate2D {
    func convertToLocation() -> Location {
        Location(latitude: latitude, longitude: longitude)
    }
}

public extension Location {
    func convertToCLLocationCoordinate2D() -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

