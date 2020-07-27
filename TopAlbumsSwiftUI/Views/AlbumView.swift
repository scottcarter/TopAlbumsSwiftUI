//
//  AlbumView.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import SwiftUI

struct AlbumView: View {
    private let viewModel: AlbumDisplayViewModel

    @State var image = Image(systemName: "person.crop.square.fill")

    init(viewModel: AlbumDisplayViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack {
                    Text("\(self.viewModel.albumName)")
                        .font(.headline)
                    Text("\(self.viewModel.artistName)")
                        .font(.subheadline)
                        .padding(.vertical, 5)

                    self.image
                        .resizable()
                        .frame(
                            width: Constants.Album.albumArtHeight,
                            height: Constants.Album.albumArtHeight
                    )
                        .onAppear {
                            self.viewModel.downloadImage { image in
                                self.image = Image(uiImage: image)
                            }
                    }

                    Text("\(self.viewModel.genre)")
                        .font(.subheadline)
                        .padding(.vertical, 10)
                    Text("\(self.viewModel.releaseDate)")
                        .font(.subheadline)
                        .padding(.bottom, 10)
                    Text("\(self.viewModel.copyright)")
                        .font(.body)
                }
                .padding(.all, 10)
                .frame(height: proxy.size.height, alignment: .top)
                .navigationBarTitle("", displayMode: .inline)

                Group {
                    Button(action: {
                        self.viewModel.itunesStore()
                    }) {
                        Text("Visit in iTunes Store")
                    }
                }
                .padding(.bottom, 20)
                .frame(height: proxy.size.height, alignment: .bottom)

            }
        }
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {

        let genre = Genre(name: "Singer/Songwriter")

        let album = Album(
            artistName: "Bruce Hornsby",
            artworkURL: "https://is3-ssl.mzstatic.com/image/thumb/Music113/v4/a4/c6/ea/a4c6ea3e-dbe0-d2cc-417d-02f3013e4c05/195081745732.jpg/200x200bb.png",
            copyright: "℗ 2020 Zappo Productions marketed and distributed by Thirty Tigers",
            genres: [genre],
            name: "Non-Secure Connection",
            releaseDate: "2020-08-14",
            albumURL: "https://music.apple.com/us/album/non-secure-connection/1518821988?app=music")


        let viewModel = AlbumDisplayViewModel(
            album: album,
            imageClient: ImageClient.shared
        )

        return AlbumView(viewModel: viewModel)
    }
}
