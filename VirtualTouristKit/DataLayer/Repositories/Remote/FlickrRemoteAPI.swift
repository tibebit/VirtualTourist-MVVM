//
//  FlickrRemoteAPI.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 08/05/22.
//

import Foundation

public enum Flickr {
    public static let photosEndpoint = "https://api.flickr.com/services/rest"
    
    public enum Query {
        case method(String)
        
        public var item: URLQueryItem {
            switch self {
            case .method(let key):
                return URLQueryItem(name: "method", value: key)
            }
        }
    }
}

public class FlickrRemoteAPI: RemoteAPI {
    ///Example query https://live.staticflickr.com/{server-id}/{id}_{secret}_{size-suffix}.jpg
    private var apiKey: String
    private var endpoint = "https://api.flickr.com/services"
    private var urlSession = URLSession.shared
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func requestPhotos(data: PhotoRequest) -> [URL] {
        let components = URLComponents()
        return []
    }
    
    public func fetchImage(from: URL) -> Image {
        return Image(url: URL(string: "https://google.com")!, data: Data())
    }
}
