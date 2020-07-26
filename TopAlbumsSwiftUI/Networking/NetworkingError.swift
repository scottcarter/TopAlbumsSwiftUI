//
//  NetworkingError.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case statusCode
    case invalidImage
    case invalidURL
    case invalidResponseQueue
    case other(Error)

    static func map(_ error: Error) -> NetworkingError {
        return (error as? NetworkingError) ?? .other(error)
    }
}

