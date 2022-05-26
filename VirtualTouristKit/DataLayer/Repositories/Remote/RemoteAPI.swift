//
//  RemoteAPI.swift
//  VirtualTourist
//
//  Created by Fabio Tiberio on 08/05/22.
//

import Foundation

public protocol RemoteAPI {
    func requestPhotos(data: PhotoRequest) async -> [URL]
    func fetchImage(from: URL) async -> Image
}
