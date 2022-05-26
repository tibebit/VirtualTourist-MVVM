//
//  Array+Ext.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 26/05/22.
//

import MapKit
import VirtualTouristKit

public extension Array where Element == MKAnnotation {
    func convertToLocation() -> [Location] {
        map { $0.coordinate.convertToLocation() }
    }
}

public extension Array where Element == Stop {
    func convertToMKAnnotation() -> [MKPointAnnotation]{
        map {
            let annotation = MKPointAnnotation()
            annotation.coordinate = $0.location.convertToCLLocationCoordinate2D()
            return annotation
        }
    }
}
