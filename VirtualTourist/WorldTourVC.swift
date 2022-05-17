//
//  WorldTourVC.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 07/05/22.
//

import UIKit
import VirtualTouristKit
import MapKit

class WorldTourVC: UIViewController {
    
    public var tourGuideViewModel: TourGuideViewModel
    public var mapView = MKMapView()
    
    public init(tourGuideViewModel: TourGuideViewModel) {
        self.tourGuideViewModel = tourGuideViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLayout()
    }


}

extension WorldTourVC {
    public func createLayout() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
