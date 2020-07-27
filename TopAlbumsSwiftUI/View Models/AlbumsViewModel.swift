//
//  AlbumsViewModel.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import Combine
import Foundation

class AlbumsViewModel: ObservableObject { 

    @Published var dataSource: [AlbumRowViewModel] = []

    let albumClient: AlbumClient
    let imageClient: ImageClient

    // A set to keep references to network requests.
    private var disposables = Set<AnyCancellable>()

    init(albumClient: AlbumClient, imageClient: ImageClient) {
        self.albumClient = albumClient
        self.imageClient = imageClient

        loadAlbums()
    }
}


private extension AlbumsViewModel {
    func loadAlbums() {
        albumClient.getAlbumFeed()
            .map { response in
                response.feed.albums.map { album -> AlbumRowViewModel in
                    AlbumRowViewModel(album: album, imageClient: self.imageClient)
                }
        }
        .sink(
            receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = []
                case .finished:
                    break
                }
            },
            receiveValue: { [weak self] albumRows in
                guard let self = self else { return }
                self.dataSource = albumRows
        })
            .store(in: &disposables)
    }
}
