//
//  VTAppDependencyContainer.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 07/05/22.
//

import Foundation
import VirtualTouristKit

public class VTAppDependencyContainer {
    
    let sharedTourGuideRepository: TourGuideRepository
    
    public init() {
        func makeTourGuideRepository(apiKey: String?) -> VTTourGuideRepository {
            guard let apiKey = apiKey else {
                return VTTourGuideRepository(dataStore: FakeDataStore(), remoteAPI: FakeRemoteAPI())
            }

            return VTTourGuideRepository(dataStore: CoreDataStore(), remoteAPI: FlickrRemoteAPI(apiKey: apiKey))
        }
        
        sharedTourGuideRepository = makeTourGuideRepository(apiKey: Bundle.main.infoDictionary?["FLICKR_API_KEY"] as? String)
    }
    
    func makeWorldTourVC() -> WorldTourVC {
        WorldTourVC(tourGuideViewModel: makeTourGuideViewModel())
    }
    
    func makeTourGuideViewModel() -> TourGuideViewModel {
        return TourGuideViewModel(tourGuideRepository: sharedTourGuideRepository)
    }
    
}
