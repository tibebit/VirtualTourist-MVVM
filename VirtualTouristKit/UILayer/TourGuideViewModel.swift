//
//  TourGuideViewModel.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 08/05/22.
//

import Foundation


public class TourGuideViewModel {
    
    public var tourGuideRepository: TourGuideRepository
    
    public init(tourGuideRepository: TourGuideRepository) {
        self.tourGuideRepository = tourGuideRepository
    }
    
    
    public func add(stop: Stop) {
        tourGuideRepository.store(stop: stop)
    }
    
    
    public func loadStops() -> [Stop]{
        tourGuideRepository.retrieveStops()
    }
    
    
    public func loadImages(for stop: Stop) -> [Image] {
        tourGuideRepository.retrieveImages(from: stop.id)
    }
}
