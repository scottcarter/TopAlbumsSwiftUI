//
//  AlbumViewModel.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import Combine
import Foundation
import UIKit

class AlbumViewModel {

    let album: Album
    let imageClient: ImageClient

    // A set to keep references to network requests.
    private var disposables = Set<AnyCancellable>()

    
    init(album: Album, imageClient: ImageClient) {
        self.album = album
        self.imageClient = imageClient
    }

    func downloadImage(completion: @escaping (UIImage) -> Void ) {
        guard let thumbnailURL = URL(string: album.artworkURL) else {
            return
        }

        imageClient.download(fromURL: thumbnailURL)
            .sink(receiveCompletion: { downloadCompletion in
                switch downloadCompletion {
                case .finished: break
                case .failure:
                    return
                }
            }, receiveValue: { image in

                completion(image)
            })
            .store(in: &disposables)
    }
}
