//
//  AlbumRowView.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import SwiftUI

struct AlbumRowView: View {
    private let viewModel: AlbumRowViewModel

    @State var image = Image(systemName: "person.crop.square.fill")

    let cornerRadius: CGFloat = 7.5

    init(viewModel: AlbumRowViewModel) {
        self.viewModel = viewModel

        UITableViewCell.appearance().backgroundColor = UIColor.systemBackground
    }

    var body: some View {
        NavigationLink(destination: viewModel.albumView) {
            HStack {
                image
                    .resizable()
                    .frame(
                        width: Constants.AlbumsTable.rowHeight,
                        height: Constants.AlbumsTable.rowHeight
                )
                    .cornerRadius(cornerRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(Color.white, lineWidth: 2.5)
                )
                    .onAppear {
                        self.viewModel.downloadImage { image in
                            self.image = Image(uiImage: image)
                        }
                }

                VStack(alignment: .leading) {
                    Text("\(viewModel.albumName)")
                        .font(.headline)
                        .padding(.vertical, 10)
                    Text("\(viewModel.artistName)")
                        .font(.subheadline)
                }
                .padding(.leading, 8)
            }
        }
    }
}

struct AlbumsRowView_Previews: PreviewProvider {
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

        let viewModel = AlbumRowViewModel(
            album: album,
            imageClient: ImageClient.shared
        )

        return AlbumRowView(viewModel: viewModel)
    }
}
