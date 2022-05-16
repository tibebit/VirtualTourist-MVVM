//
//  DataStore.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 08/05/22.
//

import Foundation

public protocol DataStore {
    func store(stop: Stop)
    func store(images: [Image], for: UUID)
    func retrieveStops() -> [Stop]
    func retrieveImages(for: UUID) -> [Image]
}
