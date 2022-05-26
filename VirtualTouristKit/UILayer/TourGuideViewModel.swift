//
//  TourGuideViewModel.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 08/05/22.
//

import Foundation


public class TourGuideViewModel {
    
    public var tourGuideRepository: TourGuideRepository
    @Published public var stops:[Stop] = []
    
    public init(tourGuideRepository: TourGuideRepository) {
        self.tourGuideRepository = tourGuideRepository
    }
    
    
    public func add(stop: Stop) {
        stops.append(stop)
        tourGuideRepository.store(stop: stop)
    }
    
    
    public func retrieveStops() {
        stops = tourGuideRepository.retrieveStops()
    }
    
    
    public func loadImages(for stop: Stop) -> [Image] {
        tourGuideRepository.retrieveImages(from: stop.id)
    }
}
