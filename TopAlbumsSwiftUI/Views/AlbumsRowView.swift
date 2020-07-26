//
//  AlbumsRowView.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import SwiftUI

struct AlbumsRowView: View {
    private let viewModel: AlbumsRowViewModel

    @State var image = Image(systemName: "photo")

    let cornerRadius: CGFloat = 7.5

    init(viewModel: AlbumsRowViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
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
                Text("\(viewModel.artistName)")
                    .font(.subheadline)
            }
            .padding(.leading, 8)
        }
    }
}

struct AlbumsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Text("No current preview")
    }
}
