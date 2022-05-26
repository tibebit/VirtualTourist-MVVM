//
//  VirtualTouristTests.swift
//  VirtualTouristTests
//
//  Created by Fabio Tiberio on 26/05/22.
//

import XCTest
import Combine
import MapKit
@testable import VirtualTourist
import VirtualTouristKit

class VirtualTouristTests: XCTestCase {
    var subscriptions: [AnyCancellable] = []
    
    override func setUp() {
        subscriptions = []
    }
    
    func test_TourGuideViewModel_PublishesOneStopAfterLongTapDetection() {
        let tourGuideViewModel = TourGuideViewModel(tourGuideRepository: TourGuideRepositoryStub())
        let worldTourVC = WorldTourVC(tourGuideViewModel: tourGuideViewModel)
        worldTourVC.loadViewIfNeeded()
        
        worldTourVC.longTapDetected(worldTourVC.convertibleLongTap)
        
        
        tourGuideViewModel.$stops
            .sink(receiveValue: { stops in
                XCTAssertEqual(1, stops.count)
            })
            .store(in: &subscriptions)
    }
    
    func test_WorldTourMapView_AddsOneAnnotationAfterLongTapDetection() {
        let tourGuideViewModel = TourGuideViewModel(tourGuideRepository: TourGuideRepositoryStub())
        let worldTourVC = WorldTourVC(tourGuideViewModel: tourGuideViewModel)
        worldTourVC.loadViewIfNeeded()
        
        worldTourVC.longTapDetected(worldTourVC.convertibleLongTap)
        
        worldTourVC.mapView.annotations.publisher.sink(receiveValue: { _ in
            XCTAssertEqual(worldTourVC.mapView.annotations.count, tourGuideViewModel.stops.count)
        })
        .store(in: &subscriptions)
    }
}
