//
//  SceneDelegate.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo _: UISceneSession,
        options _: UIScene.ConnectionOptions
    ) {

        guard let windowScene = scene as? UIWindowScene else { return }

        let viewModel = AlbumsViewModel(
            albumClient: AlbumClient.shared,
            imageClient: ImageClient.shared
        )

        let albumsView = AlbumsView(viewModel: viewModel)

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: albumsView)
        self.window = window
        window.makeKeyAndVisible()
    }

}
