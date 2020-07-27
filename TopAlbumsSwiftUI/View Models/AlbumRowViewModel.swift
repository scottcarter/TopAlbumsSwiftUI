//
//  AlbumRowViewModel.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import SwiftUI

// Needs to conform to Identifiable in order to user ForEach in AlbumsView
class AlbumRowViewModel: AlbumViewModel, Identifiable {

    var id: String {
        return albumName + artistName
    }

    var albumName: String {
        return album.name
    }

    var artistName: String {
        return album.artistName
    }

}


extension AlbumRowViewModel {
  var albumView: some View {
    return AlbumBuilder.makeAlbumView(
      withAlbum: album,
      imageClient: imageClient
    )
  }
}
