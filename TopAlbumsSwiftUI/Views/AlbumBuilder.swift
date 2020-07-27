//
//  AlbumBuilder.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import SwiftUI

// This entity will act as a factory to create screens that are
// needed when navigating from the AlbumsRowView.
enum AlbumBuilder {
  static func makeAlbumView(
    withAlbum album: Album,
    imageClient: ImageClient
  ) -> some View {
    let viewModel = AlbumDisplayViewModel(
      album: album,
      imageClient: imageClient
    )
    return AlbumView(viewModel: viewModel)
  }
}

