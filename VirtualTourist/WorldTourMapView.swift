//
//  WorldMapTourView.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 18/05/22.
//

import MapKit
import Combine
import VirtualTouristKit

public class WorldTourMapView: MKMapView {
    
    public var tourGuideViewModel: TourGuideViewModel
    private var subscriptions = Set<AnyCancellable>()
    
    public init(frame: CGRect = .zero, tourGuideViewModel: TourGuideViewModel) {
        self.tourGuideViewModel = tourGuideViewModel
        super.init(frame: .zero)
        bindTourStops()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func bindTourStops() {
        tourGuideViewModel.$stops
            .receive(on: DispatchQueue.main)
            .flatMap {
                  $0.convertToMKAnnotation()
                    .publisher
                    .eraseToAnyPublisher()
            }
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.addAnnotation($0)
                self.setCenter(self.centerCoordinate, animated: false)
            })
            .store(in: &subscriptions)
    }
}

public class ConvertibleTapRecognizer: UILongPressGestureRecognizer {
    public var mapView: MKMapView {
        view as! MKMapView
    }
    
    public func convertTapToLocation() -> Location {
        mapView
            .convert(location(in: mapView), toCoordinateFrom: mapView)
            .convertToLocation()
    }
}
