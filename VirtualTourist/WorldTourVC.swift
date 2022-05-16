//
//  WorldTourVC.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 07/05/22.
//

import UIKit
import VirtualTouristKit

class WorldTourVC: UIViewController {
    
    public var tourGuideViewModel: TourGuideViewModel
    
    
    public init(tourGuideViewModel: TourGuideViewModel) {
        self.tourGuideViewModel = tourGuideViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

extension WorldTourVC {
    public func createLayout() {
        
    }
}
