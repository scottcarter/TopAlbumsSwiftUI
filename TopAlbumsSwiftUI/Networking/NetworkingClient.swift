//
//  NetworkingClient.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import Foundation

class NetworkingClient {

    // MARK: - Constants

    let responseQueue: DispatchQueue?
    let session: DataTaskMaker

    // MARK: - Initializers

    init(
        session: DataTaskMaker,
        responseQueue: DispatchQueue?
    ) {

        self.responseQueue = responseQueue
        self.session = session
    }

}
