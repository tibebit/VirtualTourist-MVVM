//
//  FakeDataStore.swift
//  VirtualTouristKit
//
//  Created by Fabio Tiberio on 16/05/22.
//

import Foundation


public class FakeDataStore: DataStore {
    public var stops = [Stop]()
    
    public init() {
        
    }
    
    public func store(stop: Stop) {
        stops.append(stop)
    }
    
    public func store(images: [Image], for uuid: UUID) {
        guard var stop = findStop(for: uuid) else { return }
        stop.images = images
        store(stop: stop)
    }
    
    public func retrieveStops() -> [Stop] {
        stops
    }
    
    public func retrieveImages(for uuid: UUID) -> [Image] {
        guard let stop = findStop(for: uuid) else { return [] }
        return stop.images
    }
    
    private func findStop(for uuid: UUID) -> Stop? {
        guard let index = stops.firstIndex(where: {$0.id == uuid}) else { return nil}
        return stops.remove(at: index)
    }
}
