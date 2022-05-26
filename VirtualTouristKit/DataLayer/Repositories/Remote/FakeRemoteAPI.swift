//
//  FakeRemoteAPI.swift
//  VirtualTouristKit
//
//  Created by Fabio Tiberio on 16/05/22.
//

import Foundation


public class FakeRemoteAPI: RemoteAPI {
    
    public init() {
        
    }
    
    public func requestPhotos(data: PhotoRequest) async-> [URL] {
        return []
    }
    
    public func fetchImage(from url: URL) async -> Image {
        return Image(url: url, data: url.dataRepresentation)
    }    
}
