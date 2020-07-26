//
//  AlbumClient.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import Combine
import Foundation

class AlbumClient: NetworkingClient {

    // MARK: - Constants

    private let albumFeedURL: URL?

    static let shared =
        AlbumClient(
            albumFeedURL: Constants.AlbumFeed.feedURL,
            session: URLSession.shared,
            responseQueue: .main
    )

    // MARK: - Initializers

    init(
        albumFeedURL: URL?,
        session: DataTaskMaker,
        responseQueue: DispatchQueue?
    ) {
        self.albumFeedURL = albumFeedURL

        super.init(session: session, responseQueue: responseQueue)
    }

    // MARK: - Functions

    func getAlbumFeed() -> AnyPublisher<AlbumFeed, NetworkingError> {

        guard let albumFeedURL = albumFeedURL else {
            let error = NetworkingError.invalidURL
            return Fail(error: error).eraseToAnyPublisher()
        }

        guard let responseQueue = responseQueue else {
            let error = NetworkingError.invalidResponseQueue
            return Fail(error: error).eraseToAnyPublisher()
        }

        let urlRequest = URLRequest(url: albumFeedURL)

        return session.dataTaskPublisher(for: urlRequest)

            .receive(on: responseQueue)
            .tryMap { dataTaskOutput in
                guard
                    let httpURLResponse = dataTaskOutput.response as? HTTPURLResponse,
                    httpURLResponse.statusCode == 200
                    else {
                        throw NetworkingError.statusCode
                }
                return dataTaskOutput.data
        }

        .decode(type: AlbumFeed.self, decoder: JSONDecoder())
        .mapError { NetworkingError.map($0) }
        .eraseToAnyPublisher()
    }

}
