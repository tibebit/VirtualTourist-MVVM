//
//  WorldMapTourView.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 18/05/22.
//

import MapKit
import VirtualTouristKit

public class WorldTourMapView: MKMapView {
    public var tourGuideViewModel: TourGuideViewModel
    
    public init(tourGuideViewModel: TourGuideViewModel) {
        self.tourGuideViewModel = tourGuideViewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
