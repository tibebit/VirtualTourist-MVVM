//
//  WorldTourVC.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 07/05/22.
//

import UIKit
import VirtualTouristKit
import MapKit

public class WorldTourVC: UIViewController {
    
    public var tourGuideViewModel: TourGuideViewModel
    public var mapView: WorldTourMapView
    public lazy var convertibleLongTap = {
        return ConvertibleTapRecognizer(target: self, action: #selector(longTapDetected(_:)))
    }()
    
    public init(tourGuideViewModel: TourGuideViewModel) {
        self.tourGuideViewModel = tourGuideViewModel
        self.mapView = WorldTourMapView(tourGuideViewModel: tourGuideViewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        createLayout()
        mapView.addGestureRecognizer(convertibleLongTap)
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "TourStop")
        mapView.delegate = self
    }
    
    
    @objc func longTapDetected(_ sender: ConvertibleTapRecognizer) {
        tourGuideViewModel.add(stop: Stop(location: sender.convertTapToLocation()))
    }
}


extension WorldTourVC: MKMapViewDelegate {
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "TourStop"
        
        var marker = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? MKMarkerAnnotationView

        if marker == nil {
            marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            marker!.canShowCallout = true
            marker!.tintColor = .red
        }
        else {
            marker!.annotation = annotation
        }
        return marker
    }
}


public extension WorldTourVC {
    
    func createLayout() {
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
