//
//  TourGuideRepository.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 07/05/22.
//

import Foundation


public protocol TourGuideRepository {
    func store(stop: Stop) 
    func retrieveStops() -> [Stop]
    func retrieveImages(from uuid: UUID) -> [Image]
    func store(images: [Image], for: UUID)
    func requestPhotos(at location: Location)
}
