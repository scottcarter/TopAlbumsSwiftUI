//
//  Feed.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import Foundation

struct Feed: Codable {
    let albums: [Album]

    enum CodingKeys: String, CodingKey {
      case albums = "results"
    }
}
