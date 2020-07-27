//
//  AlbumViewModel.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import Foundation

class AlbumDisplayViewModel: AlbumViewModel {

    var albumName: String {
        return album.name
    }

    var artistName: String {
        return album.artistName
    }

    var genre: String {
        return album.genres.first?.name ?? ""
    }

    var releaseDate: String {
        return formattedDate(from: album.releaseDate)
    }

    var copyright: String {
        return album.copyright
    }

}

private extension AlbumDisplayViewModel {

    // Format the release date presentation
    func formattedDate(from releaseDate: String) -> String {

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = .current

        if let date = formatter.date(from: releaseDate) {
            formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MMMM d YYYY", options: 0, locale: .current)
            return formatter.string(from: date)
        } else {
            return releaseDate
        }
    }

}
