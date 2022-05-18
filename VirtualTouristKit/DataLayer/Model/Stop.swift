//
//  Stop.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 08/05/22.
//

import Foundation

public struct Location {
    
    public var latitude: Double
    public var longitude: Double
}

public struct Image {
    
    public var url: URL
    public var data: Data
}

public class Stop: Identifiable {
    
    public let id = UUID()
    public var location: Location
    public var images: [Image]
    
    
    public init(location: Location, images: [Image]) {
        self.location = location
        self.images = images
    }
}
