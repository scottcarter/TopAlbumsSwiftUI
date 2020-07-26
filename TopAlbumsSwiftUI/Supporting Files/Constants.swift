//
//  Constants.swift
//  TopAlbums
//
//  Created by Scott Carter on 7/13/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import Foundation
import UIKit

enum Constants {

    enum AlbumFeed {

        // The max number of albums to fetch.  This is currently limited
        // to 51 by the server.
        static let numberOfAlbums = 100

        static var feedURL: URL? {
            let feedBase = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all"
            let feed = "\(feedBase)/\(numberOfAlbums)/explicit.json"

            return URL(string: feed)
        }

        // For testing
        static var thumbnailURL = URL(string: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/a1/09/bc/a109bc6a-21d2-53c5-248a-be19b20ba9da/20UMGIM53351.rgb.jpg/200x200bb.png")

    }

    enum Album {
        static let albumArtHeight: CGFloat = 200.0 // The size of original

        // For elements used in UI testing, the accessibility identifiers should
        // all be unique. Consider the case where the Album view controller is pushed onto
        // the navigation stack.  If a table cell label (such as album name) shared the
        // same identifier as a label in Album view controller, the UI test would
        // not be able to distiguish the elements with a simple query from XCUIApplication.
        //
        // They also must be constant strings, so UUID().uuidString is not acceptable.
        // This is because this file is apparently compiled once for the app, and a
        // a second time for any UI test that includes it.
        static let albumNameIdentifier = "Album_albumName"
        static let artistNameIdentifier = "Album_artistName"

        // Dark mode support for store button border color variation.
        static let buttonBorderColor = UIColor {(traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return UIColor.white
            } else {
                return UIColor.black
            }
        }
    }

    enum AlbumsTable {
        static let rowHeight: CGFloat = 100.0
        static let albumArtHeight: CGFloat = 90.0 // To allow for row separation

        static let albumNameIdentifier = "AlbumsTable_albumName"
        static let artistNameIdentifier = "AlbumsTable_artistName"
    }

}
