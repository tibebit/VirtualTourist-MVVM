//
//  VTTourGuideRepository.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 07/05/22.
//

import Foundation


public class VTTourGuideRepository: TourGuideRepository {
    public var dataStore: DataStore
    public var remoteAPI: RemoteAPI
    
    
    public init(dataStore: DataStore, remoteAPI: RemoteAPI) {
        self.dataStore = dataStore
        self.remoteAPI = remoteAPI
    }
    
    
    public func store(stop: Stop) {
        dataStore.store(stop: stop)
    }
    
    
    public func retrieveStops() -> [Stop] {
        dataStore.retrieveStops()
    }
    
    
    public func retrieveImages(from uuid: UUID) -> [Image]{
        dataStore.retrieveImages(for: uuid)
    }
    
    
    public func store(images: [Image], for uuid: UUID) {
        dataStore.store(images: images, for: uuid)
    }
    
    
    public func requestPhotos(at location: Location) {
        
    }
}
