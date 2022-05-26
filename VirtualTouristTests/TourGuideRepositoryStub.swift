//
//  TourGuideRepositoryStub.swift
//  VirtualTouristKitTests
//
//  Created by Fabio Tiberio on 21/05/22.
//

import Foundation
import VirtualTouristKit

public class TourGuideRepositoryStub: TourGuideRepository {
    public func store(stop: Stop) {}

    public func retrieveStops() -> [Stop] {return []}

    public func retrieveImages(from uuid: UUID) -> [Image] {return []}

    public func store(images: [Image], for: UUID) {}

    public func requestPhotos(at location: Location) {}
}
